Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4BEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 12:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YjXNF8u6gFmP3bof4Qnz0c0Cqvunc1cPgbGWTZ/EO4s=; b=drlZuZTujwywAB3YNDYK9mlHNb
	zaSE9hyHMl8lYK6etmUj7D/4qTc3bztOXxoq+SmasRkYTSpjHN0PEL+LbQ6rq3SMQsaQnZ8Uev7gt
	fpISyCHsiHDEZt1wo+kRFy3kd55SLq93PTai6phjZN1+iMKAPucSrrtQBf5qrRdxpN/h43iy40A9o
	Awn2dKRYvef17uETRp7sBVY7MdaCadYZ1NBq2jF8hReSN5l4GUMYfPdK4ApCAGmJKJpKJn0TdSes0
	r8klnoFAa0UPuCnXMuYUv2BxAJ5YoHKBMFmShOTGHxBQ1DgmrVGK8uWsxwnkqmXQE4WVkblVKB04G
	vaXCRcVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSF0t-00000005BwL-0AJR;
	Mon, 30 Dec 2024 12:36:51 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSEyr-00000005BbP-2nVW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 12:34:47 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-30227c56b11so106836451fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 04:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735562084; x=1736166884; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YjXNF8u6gFmP3bof4Qnz0c0Cqvunc1cPgbGWTZ/EO4s=;
        b=A4dofS8NBQWmzqBqfys0G9I8MmB4opmha9pP6qleN3I0c8Cb2RgIdBpu2hKqXxY/az
         hBl4LN8YVuoCc0HZNYH64RxVxasJU77vn0UFBdqmeXLiss2WHtQzPPfOv4rVcc2b5DDR
         qbDgK+7eVbdzHuN/Fx3eUvi9s7QBpckSr9rdRa7glQbha1rJbnyHGk41QZSK40zIksvx
         0cZ3t/SjbtNXUUgM/B+cZFI23IMu9cvo3lteCs0De6/ohkH4NXZrn/UXGci70vrk89ie
         CfnWVdKypIKF7BrB/C9gn3q885B0W9Di8xJC+O6Gqr97/+qUGRv1ciHiXpQhAfk+UxJB
         JYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735562084; x=1736166884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjXNF8u6gFmP3bof4Qnz0c0Cqvunc1cPgbGWTZ/EO4s=;
        b=S0++D7dfVFT7mfRSSq9XNhLS472Sk5+W5+Vhzvgb6lNriW54kyatAlYekmFFJDc16b
         ndCU9ReP/Knx/Z6pL2xfN2Iz2+ZDA7COBQenw0DB4UD47+03euchLXbaWK2c/jN/R54r
         9FsyOEit1uPpkSYzY5uG5RbMa6fPG4PjJB5yv3C8I87gYINcbFykKY7e7Ei6shJbOuDY
         bQp/C0KYLV27IQTV7fiBszYz7N0kZNuP/la6ADR1/H2CTC46hXLUVMSnjoHStuaLBTO1
         q0QblsVLxtIW9T4AIxQcANlXPzKijuiqk7MYjVuykncFFNtFIKtdEVMcIIlRHxPMJhwC
         bmXg==
X-Forwarded-Encrypted: i=1; AJvYcCUFdToyOGdklJft6dTFdQ85pv1k6PNWoWOawEaDeptR70WVFt0jN9lZ49p7dSF5bk8+WrnhXNoW3P+KJjqDnR5S@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7ya+wWlmS5Y1lDOari1HKrBN8n/CPxa4V2fTIzl5488ZVskk5
	WFJHehOW0Y+dCCaOquoGZbDIbkrYaWkh6TlehWblAo8SulGiYTCACbipfzgkgAw=
X-Gm-Gg: ASbGncvj5SPtHAbOHWCeukohajWu1LnJ4GiTQNFiXelHrwhy0rymoUyCfZyVCVTsRU4
	alIo7nv3hddIFifSYcmKjdT7is1CEMuqD75Ure60jiZzZp+OcHElRlFxN9HCZgKF1m5hT11K3F4
	jD6eX+RjzndfZpQYy/qfn9HHbfbedV0AtMPVS2iq9GAh3bIO2FtSZy9AsURs27clRmLuy8pJ/pz
	RO1+Twe9iiS2JG+xFRD4zRDQtFAGFa3bgmBACQ5FLpTEtxacOqwbPul19/oAW7fS/jkeoSuZCa+
	4SeamLGOlMezBcOll4Xyi/dyVazMncEsGAPT
X-Google-Smtp-Source: AGHT+IGALgVEuR6VwAjmraqK3t5VKz84isdY66XsU2c6gkzu6ybhJpLRqnsbX8hjceGwE1pfjHVNsQ==
X-Received: by 2002:a2e:a69f:0:b0:300:377d:2c36 with SMTP id 38308e7fff4ca-30468630934mr83167351fa.40.1735562082309;
        Mon, 30 Dec 2024 04:34:42 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad9bbdesm34304741fa.44.2024.12.30.04.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 04:34:41 -0800 (PST)
Date: Mon, 30 Dec 2024 14:34:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 06/17] phy: phy-rockchip-samsung-hdptx: Add the
 '_MASK' suffix to all registers
Message-ID: <3dgfsscqpvlqzajjeav6oneeyae2tpc46av7hadgon5uwqibg5@ubziqwztp62m>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
 <20241226063313.3267515-7-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226063313.3267515-7-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_043445_702593_1312A8AC 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

On Thu, Dec 26, 2024 at 02:33:02PM +0800, Damon Ding wrote:
> Adding the '_MASK' suffix to all registers ensures consistency in the
> naming convention for register macros throughout the file.

Nit: usually it would be "Add the '_MASK' suffix [...] in order to
ensure consistency [...]".

> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

