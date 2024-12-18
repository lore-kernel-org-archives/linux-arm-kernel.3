Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F92E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 11:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgC6FT2aLsRk0iznKN/lYkL6v9+y1HJaw8g4ZlWCUFU=; b=q3NAvz1Y8ddz+PcJEYJPas1/2t
	Lhi4ivU9J8zfs0PSQhO0f2YfVVICJ7P2hbuGFNtfIogmYw6FYDwPXnudcbBIAEJ5mAmvAUG8sHFLb
	ncT1YS/Bm4CaF5RvEnAzw4OYkevvcLJ3oXXfYp9QdMfELPfYzWWq6wB8ZGuPlE4nIyuq6LvrmN7NA
	VVOW2Z+tSsQLN1ySFU7/FELfvG0o9GPKNbAw/5WYbr9Z+WDbVxRjZ19ZVIAsk7IMucHEDbR4SmeSq
	ANMQcyo1tGlyHZv82BvMXz83p2VKqyTgwfKcTbiMQvfXarMOP5DPFqzUMjjDyGPsICZXbw9s4OtyA
	+DvUT1MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsNV-0000000GTS4-0RZm;
	Wed, 18 Dec 2024 11:38:09 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsMO-0000000GTEt-19WF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 11:37:02 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-53e3a5fa6aaso699627e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 03:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734521818; x=1735126618; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mgC6FT2aLsRk0iznKN/lYkL6v9+y1HJaw8g4ZlWCUFU=;
        b=OTcaAoi/2tUjwbtkyi4gchbwAHcKWMHOqyhu9GaKM9BXEdC6PcnO4XfkixB7X4QThR
         h7Gi6n2LA9tBzfxjHYDAeyl6592rymNzuZ632DrlVEiU5xIyamnjNX/N2Koe/03F5C1o
         xofEScqUTIwBu9gs/3PrdLnc66XifSOFHZ99/w6tmJzgO3M5lLggWWhp9YYACK8elIt1
         Em6O3anSvvsSITIDwRp5swOcHhkc0KopeXI10A8rmi8Pq4E+pA9gaMNJJo96JnILeHS+
         49Sx5SooeKqBoyf+/S6enzjtt4pwMiNMU/7CvKCclZDxIVoyb9ewEous+uWYh6i23ndz
         qb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734521818; x=1735126618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgC6FT2aLsRk0iznKN/lYkL6v9+y1HJaw8g4ZlWCUFU=;
        b=uRChy9ckcvC8z0sVhesfHjgaGwYA52eN3+378vS1MghcGdsLc0vbmrHBZd68fMe1Uq
         r6/RsPbVegeeyYQGGDNsQ/X6d5Qb3uOYOFKK9lUXjRiphIhMK65KSLRVbYDj29z0ptjj
         wr7/IyP2spJUKRoMg9k0Acg51lHf+dFPEY3p2JqVTqVHMKsimFvJ5Ro0yBLyM4GjA64w
         jXsjcbxodprrOtJxI21EltUTL791vca+t6wrtFIPKnaDQWOZCDL+QUzW8yiUxexUw6ni
         gWa58dSTqmMPsNpEEK63S0cyj8kgIRvhLmPJWKpaQ/MmHo9r1+j4x4IgVcZ03vNDI0UU
         o0Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXifmknHvqNUPFjrzwooJCkDMC79YMrh9BQUFRyVzE0n0MS4MIhoWzZlRVQis/z/WIz3Y0KW1VBaXwomV62++Vc@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi4zOG4Gu7r3/kw3KjZQ+vTQTsE34g52eNKYKJN1xhHFdhMGGa
	rPp9rjHYX+49vxgc9pqOs6IVOVnTiDodIl5GTtjAYdCl70ZIypMRNo97n8jc6qq4kRnfI2ID1qZ
	f
X-Gm-Gg: ASbGncuakmhP6U9kXG84MfZ+zqKb7fzuWiO2T2jFycFOodfu+NLuUuGQ8XfNRLt0lfw
	/xnNiL8xi4vu2Pa5UMfBWrVIIYID4+uvwfQ+xAYsjDuL2h9LAqkOlEd3ZcapAh6QX1RXShqLTlB
	Sdua3oC1eWknf5Z6OC56qDXGFPBCW9IfIxgBM6cQdmvDpKdwkA5hKg4slbjNRtLycg0zg7c8NK3
	oDWA8dsIl/dRq0UCxxp7Iv4XppYS24Q4JR5GXdVV1A0x8YuiQBKybWGETBJTAgTp8DbbnaE9uIO
	qQQvXrVgs3UG0UvtiAJsUnYJyna9mA8RyFmF
X-Google-Smtp-Source: AGHT+IEZ+sSU1SDLXJ8oJNi+0fhecW4BHBNr3eJX66/i9r+4ejfv6uryNvgWsgMb3aNXDMPAIOxqLg==
X-Received: by 2002:a05:6512:ad5:b0:540:1fb3:e061 with SMTP id 2adb3069b0e04-541315b4f48mr2268645e87.28.1734521817999;
        Wed, 18 Dec 2024 03:36:57 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9db5sm1426597e87.88.2024.12.18.03.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 03:36:57 -0800 (PST)
Date: Wed, 18 Dec 2024 13:36:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org, todor.too@gmail.com, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com, 
	hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org, 
	hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH v10 1/4] media: dt-bindings: update clocks for
 sc7280-camss
Message-ID: <hevfx4sgsatohz4ndgrlidj5kqxaiizmakjqjghlkbmguluzi5@ezxa36uasb32>
References: <20241217140656.965235-1-quic_vikramsa@quicinc.com>
 <20241217140656.965235-2-quic_vikramsa@quicinc.com>
 <02da691b-1f5d-41a6-847c-c7e9b8239919@kernel.org>
 <c14493b0-c9d3-4e1c-9f86-991b4cb25c98@linaro.org>
 <fe28a9bc-82ef-4fef-af50-9d9261ed9b39@kernel.org>
 <a1032d53-6f3e-48f6-a2e9-1315bb1a3232@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1032d53-6f3e-48f6-a2e9-1315bb1a3232@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_033700_314779_08105435 
X-CRM114-Status: GOOD (  24.43  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Dec 17, 2024 at 04:30:37PM +0000, Bryan O'Donoghue wrote:
> On 17/12/2024 16:23, Krzysztof Kozlowski wrote:
> > On 17/12/2024 17:12, Bryan O'Donoghue wrote:
> > > On 17/12/2024 14:10, Krzysztof Kozlowski wrote:
> > > > On 17/12/2024 15:06, Vikram Sharma wrote:
> > > > > This patch change clock names to make it consistent with
> > > > > existing platforms as gcc_cam_hf_axi -> gcc_axi_hf.
> > > > > This also adds gcc_axi_sf and remove gcc_camera_ahb.
> > > > 
> > > > Don't combine ABI changes with some less important things.
> > > > 
> > > > You miss here explanation why doing the ABI change in the first place.
> > > > Without that explanation I find it rather churn. But anyway, reason for
> > > > ABI break and impact should be documented in commit msg.
> > > > 
> > > > > 
> > > > > Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> > > > > ---
> > > > 
> > > > Best regards,
> > > > Krzysztof
> > > 
> > > This change should be fine since we haven't committed and upstream dtsi,
> > > so there's no ABI to break yet.
> > > 
> > > Agree the cover letter should have been explicit in explaining.
> > 
> > So these are recently added bindings (sc7280 is not particularly new)?
> > If so mention in the commit msg that no users are affected because of this.
> > 
> > Best regards,
> > Krzysztof
> 
> Agreed.
> 
> The commit log should make clear that the ABI hasn't been cemented yet.
> 
> 20241217140656.965235-4-quic_vikramsa@quicinc.com <- is still pending

If it hasn't been comitted yet, isn't it better to post a fixed version
rather than committing a version which has known issues?

> 
> ---
> bod

-- 
With best wishes
Dmitry

