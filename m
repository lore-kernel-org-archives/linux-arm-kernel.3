Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473E2C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 04:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nlBEY6HRx3gs6GmX9n8FOaCyjO7em88PtYwWGu+mg9c=; b=2pmBGxDE9EicMKM0y6P/zooqda
	t8Smoxi6+334pG0m/ENtU3ttT9+ZBuFh0Z2djQllUvYWFcOkxsAM6Iw4u2csOEeX+3swRIMIeXKeF
	aUvOfAVgIVAjg8aa1MZ64alnPuvJUsakrZSGISUG56cJh3mrxM9qZUKlrMcNOhp+LlwwdsJaXRrwB
	WDv7hDu6FgeQxiq1Tfc73IWzgHSh3kTR8KesCn6z0FIG2h+svVCUGeMmHL/jquf/Uqzcw0NrRKKAA
	sD+ZsIpdq6Jwevn+l4Rc8E0YNo/rPYh0hQOKh4HoV7OtxT5Vf3Bw0r5gmte1d5rW8Bktc0Nl8Ly39
	8FuPtlIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue4OH-00000001F3o-1AYh;
	Tue, 22 Jul 2025 04:14:09 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue4L4-00000001Ejq-11lf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 04:10:52 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b1fd59851baso3375666a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 21:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753157449; x=1753762249; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nlBEY6HRx3gs6GmX9n8FOaCyjO7em88PtYwWGu+mg9c=;
        b=Ph/KSLzDUyCCUMSFZlyRSwTff+rrrytcrg+Ngq/BIGtBBZS8jTo6BCsK0we7GaWlhO
         hdh16xoKozJlL3M/hyJ7YjYHByJtHFQmohuVPY0BmP8p4GyQpjAv3hk/Mh8szsZYRJEM
         FK3UUlyjuA6bDfW1vpbPdupHULOyDnq0nzHfXycewdIfALdpj04ijlaAi4TnLboov4LO
         1t4Eq4ocM66R38QncaiF//aU/6UUdjf+AWydbHCbX8cGCc2bHw5ql+/el7ogNXVPoEUA
         Mo5S8KN2XOPZm4S7637fSWbxpg6eFjRWT32m1NSpdmVvMvbvQ9W+5cVR+9qkLUdkidU3
         4+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753157449; x=1753762249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlBEY6HRx3gs6GmX9n8FOaCyjO7em88PtYwWGu+mg9c=;
        b=iu+YxL6lOhNE34Vz5CxT6RALsjgfUU6RwLmb9/XFO2Yrt7ioYKjJoWp+JemxQOQaY1
         l+ngMFo+/PPz+NDc8JFJarozsGD8skGu1QbXmOulfpvxG8YTRNq3YkmyEzWPC4o0kWBf
         nJ6Zw/HKabomItB0PCK0jr7QMluFJkMXr87SyCUQ2ZBbvFSSnPc+rDnacliqZJSFx/Kl
         0KKpY+VFZ+speuaTa8yllzRSSuoLBogPGPEb+F897gUmZ38HFEFYk0+RDuB4244PFnDB
         LIGyy6LnE1ltMKxG9/SFzodvq9Og5Ur5UJ5AXFDs0qMy7xnXv98D4qu7734kZyqV8TtX
         Fc/g==
X-Forwarded-Encrypted: i=1; AJvYcCWfTG9S8YDsIXmOdG+komFv9dz+uuV0nbFvEOvzTc0Pnx+iTZAiHYFBHbTDDFVATyClQo277XbfDUevP2cv5WqS@lists.infradead.org
X-Gm-Message-State: AOJu0YxWLYymNHzU/K3HbaIWTxSkdpNCKVBAt9s9READ/n1o8cRL5lK1
	OrmonRlJN0ZUQS8g3DRioWJ6OPQeCVIzfgIXyV0L7TNAL4zv2onP9iAWWatbmqBP6d4=
X-Gm-Gg: ASbGncuBYvm1mR142+zfhOIyIJLASe1eD8nhb7kEJNEtTsuwx3dZIQLfMuKDGLK62AL
	YlcnUtwzO+Au+BwAT7IfEvQGVusjqnm3qO0PxRUclWvKcE9GrTQOuP8izUXbneKUFdxHbrz2eLI
	g5jEZWRH4+3tHeoQzcY+NNpJW54y2g/ugObxRS4dIWQJZzmAAmEJcPEhZLL6/npIBMINO0YVXd4
	GUPqui/QVa/L2yMg1R14fhLSez1hVI9Zv7IcK20uDicCekt1/cEv7BBT2Y7g6AxUWpgFNHqS8sr
	zNDJDCCHYOXvdrDVoXJ0DCNN67yZi+wpAabZrhhZ6idC+yKbWS3OLUikIHLhUSfqkQlKnaDS8vE
	Ny0frRTuL/eLCTqqinb3x6kZvNAdJVMxsoQ==
X-Google-Smtp-Source: AGHT+IHOKWMEzyu46KKsaJPjgo0xgycpcDzWx6CxVzgF6SZy+41yLFML71qXIxEHlqlltMpTlo5GzA==
X-Received: by 2002:a05:6a21:648a:b0:231:4bbc:ff09 with SMTP id adf61e73a8af0-2381313ca9bmr31553876637.36.1753157449486;
        Mon, 21 Jul 2025 21:10:49 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c84e2c91sm6537501b3a.5.2025.07.21.21.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 21:10:48 -0700 (PDT)
Date: Tue, 22 Jul 2025 09:40:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 0/4] MT8196 CPUFreq Support
Message-ID: <20250722041046.lf4b267bmolm4exq@vireshk-i7>
References: <20250716-mt8196-cpufreq-v3-0-d440fb810d7e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716-mt8196-cpufreq-v3-0-d440fb810d7e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_211050_841612_A1873339 
X-CRM114-Status: GOOD (  16.39  )
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

On 16-07-25, 19:51, Nicolas Frattaroli wrote:
> This series adds the necessary bindings and driver changes to integrate
> MT8196 CPUFreq into the existing mediatek-cpufreq-hw driver. This
> necessitated two preparatory cleanup patches to the driver.
> 
> The CPU frequency was verified to actually be changing by comparing
> sysbench cpu numbers between fdvfs being enabled and it not being
> enabled.
> 
> Enablement in the DT will be done once the MT8196 DT lands, so don't be
> surprised that no node uses these new compatibles so far.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
> Changes in v3:
> - bindings: changed title as per angelo's suggestions
> - bindings: dropped the fdvfs magic register range
> - bindings: dropped redundant description for #performance-domain-cells
> - driver: made fdvfs frequency divisor a `#define` instead of part of
>   the variant struct
> - driver: dropped fdvfs magic check
> - driver: reworked performance domain resource offset
> - Link to v2: https://lore.kernel.org/r/20250714-mt8196-cpufreq-v2-0-cc85e78855c7@collabora.com

Applied. Thanks.

-- 
viresh

