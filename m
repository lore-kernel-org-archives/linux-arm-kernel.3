Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1433ECCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 11:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIWnZ8dEqAIo6e04DNrTq+ZCsjQol4ZAc5Df0I8mreM=; b=Ynfw9CfGxRQmr8q8X38ruHpLTo
	fB7dYR18MHK0eK+y7BhCWN+Ok5yTQaGi9pzt0TRMj7GOotrPc9L+8cxCUifpzb18kqgIl1h7aVocv
	sHCKcH9Dw7MEdGPQnJ2QqZlxulXqgVJZuPILmy+PD+FjXkgKfB1WwU1R+x681bBgb2/YNU8Vy9lQI
	WyU4lIIkwa6oyOCpOpPvSCABNejH092zQQXXR81tR1O8hrR6wP9RYEqEw7LSg0AvULITKp3T+GOR1
	/D4NbfshGaOh85PlpchCkZMshjEAxo4J6tXMh8qAVInfyAHjQkEvEXXFZA3hx8h7oaSUr9HlW0XO+
	AHSjP2QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPh4-00000005G56-2Npl;
	Mon, 10 Nov 2025 11:04:18 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPgy-00000005G4B-0a8J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 11:04:17 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-42b2a0c18caso1895249f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 03:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762772650; x=1763377450; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yIWnZ8dEqAIo6e04DNrTq+ZCsjQol4ZAc5Df0I8mreM=;
        b=sKjXapYuKOz9PJcDUKb9Kk5L7LbA+devOQiHdwfRnreUA6BqkNJtFsXG8rempMvzum
         AZvmXPWPlna7Opv9vKNqYpkCWL7m72CTsMfUzx6Rz92H+ObpDffyHIm30c6m6e8k2J7E
         Jx0EpTaMblepxf4GBPFg17yo/az1KM3JMxbvr4fBxFvpJD19vLU5JUj2QVhwzWZhVq0G
         uGsFapDw6n0XoeJ0pV00N5THJ1C+FRUtned5YzQ7Sv9VapehhpPZ5CFTV8FdzZDBacqb
         0cWv8Gc5nEBuvSSuR6p9e3+/c3jmcGjlB5kCvuQiuqOFgVvQU+BYAyinBxm+Aojus3VM
         CVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772650; x=1763377450;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIWnZ8dEqAIo6e04DNrTq+ZCsjQol4ZAc5Df0I8mreM=;
        b=aI6tnM4mVZ7RreiIhpFt+OxF4f9eKJBQUY2hyrgbPIht9RR2lDY+Q2XLKsXxB48PHV
         bj3fFZ2+WTEOfuhiP+gKkIOAT+4p93BL7gDeosxRQznN72P2a3HFOyXoPodH/DbQzNh6
         Ut17m+J3jYMykiwHDeZFwS8YFTPPm0vvif792uSG+CQRgkTIRb3zQV5vVlalVs8G3AKR
         JggOrGzND0A2b4y0RcyNxGqsu/k6cCBmbDKcGkgY5B5JMYbyPSGIBw1XTGmpX9UKhdUE
         LDZcW7H1AREf0/FTh02setSm+xUgCIIvI1PVTV9gIxUbSMe7+4NKVmeH412Qpr5oh3QF
         QygQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK0z8rGV45FTCRzGxo+62YtAns6xnXyxEcd6di7elbwG2FttGbVrx/pP4/jFoiOJDArEZnhu9YA6HdMOpVSR7j@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8xPNObGjqi+j7E5wB90ig2cseLEguQfrTdM4bpLk5S0y21cIb
	KDQxwl3TvqR+UuMf6KAz7jd5t70U5scfRkzHHfnqYsXfV7dFewdZOpjs9c2Azq5ePHI=
X-Gm-Gg: ASbGncumIXOKCfFeu2IMTeI6LrHeRu2mth4oUBk9ADZdt/U3KcOjHiEzSom7hjDtp5U
	PNVvC2uGIE98qrKnenyAMSniz89fDGKE6rzSRv+Ete/S3sfaRHZsjGb2eH7tKUj2uUcbEFOmnwX
	wG7Uf1k+Wn/GTkLPbhRfbnnVAUtUk5S02n4uYq2JBvKKilGK1FCKjpFpVij5g+6AcgCWWjcgdsm
	fT9F3rJ8R179ny6tLhqTBeKqXzY5q58QU+DNG8VZGvAMg0xg+uu3zM4Z0E+Ej9letBuHIaPuGM8
	Wpb7p6ANEhQAxaCTEm6cRx+Lzmi40isUWwhrmqsjRuurx4yPqy8TveDoHva8kHM/z/dgU0g9QYk
	CEFv0ZY+VPlxaiqeeMOwhnqjjSXUnwYJoU+xdJ63pW54wyLxzEjfDSRsi1ubA4E4f9SaGYTZKaB
	/E1x+wLCPFXpm40PWn+Xp987N5h/ri9gvDzTXQPQiX/kG5F56xMbPu
X-Google-Smtp-Source: AGHT+IH0yKFYlADFFoNgI+vt5Nvr3682vUUZksEIjYehH1HnbB5yCLv9XtMdyOspZEkknqy2NTGIgA==
X-Received: by 2002:a05:600c:c84:b0:46e:3f75:da49 with SMTP id 5b1f17b1804b1-477732a1d2bmr55933905e9.37.1762772649975;
        Mon, 10 Nov 2025 03:04:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:f168:a23e:c1b2:ae61? ([2a01:e0a:3d9:2080:f168:a23e:c1b2:ae61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47763e4f13dsm106249415e9.5.2025.11.10.03.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 03:04:09 -0800 (PST)
Message-ID: <3c98a3f1-ca68-41ed-a8bb-f99a57ac57d7@linaro.org>
Date: Mon, 10 Nov 2025 12:04:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] PCI: meson: Remove meson_pcie_link_up() timeout, message,
 speed check
To: Bjorn Helgaas <helgaas@kernel.org>, Yue Wang <yue.wang@Amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Linnaea Lavia <linnaea-von-lavia@live.com>, FUKAUMI Naoki <naoki@radxa.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, stable@vger.kernel.org
References: <20251103221930.1831376-1-helgaas@kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20251103221930.1831376-1-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_030412_249183_9CD12A1B 
X-CRM114-Status: GOOD (  21.45  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 11/3/25 23:19, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> Previously meson_pcie_link_up() only returned true if the link was in the
> L0 state.  This was incorrect because hardware autonomously manages
> transitions between L0, L0s, and L1 while both components on the link stay
> in D0.  Those states should all be treated as "link is active".
> 
> Returning false when the device was in L0s or L1 broke config accesses
> because dw_pcie_other_conf_map_bus() fails if the link is down, which
> caused errors like this:
> 
>    meson-pcie fc000000.pcie: error: wait linkup timeout
>    pci 0000:01:00.0: BAR 0: error updating (0xfc700004 != 0xffffffff)
> 
> Remove the LTSSM state check, timeout, speed check, and error message from
> meson_pcie_link_up(), the dw_pcie_ops.link_up() method, so it is a simple
> boolean check of whether the link is active.  Timeouts and and error
> messages are handled at a higher level, e.g., dw_pcie_wait_for_link().
> 
> Fixes: 9c0ef6d34fdb ("PCI: amlogic: Add the Amlogic Meson PCIe controller driver")
> Reported-by: Linnaea Lavia <linnaea-von-lavia@live.com>
> Closes: https://lore.kernel.org/r/DM4PR05MB102707B8CDF84D776C39F22F2C7F0A@DM4PR05MB10270.namprd05.prod.outlook.com
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Tested-by: Linnaea Lavia <linnaea-von-lavia@live.com>
> Cc: stable@vger.kernel.org
> ---
>   drivers/pci/controller/dwc/pci-meson.c | 36 +++-----------------------
>   1 file changed, 3 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
> index 787469d1b396..13685d89227a 100644
> --- a/drivers/pci/controller/dwc/pci-meson.c
> +++ b/drivers/pci/controller/dwc/pci-meson.c
> @@ -338,40 +338,10 @@ static struct pci_ops meson_pci_ops = {
>   static bool meson_pcie_link_up(struct dw_pcie *pci)
>   {
>   	struct meson_pcie *mp = to_meson_pcie(pci);
> -	struct device *dev = pci->dev;
> -	u32 speed_okay = 0;
> -	u32 cnt = 0;
> -	u32 state12, state17, smlh_up, ltssm_up, rdlh_up;
> +	u32 state12;
>   
> -	do {
> -		state12 = meson_cfg_readl(mp, PCIE_CFG_STATUS12);
> -		state17 = meson_cfg_readl(mp, PCIE_CFG_STATUS17);
> -		smlh_up = IS_SMLH_LINK_UP(state12);
> -		rdlh_up = IS_RDLH_LINK_UP(state12);
> -		ltssm_up = IS_LTSSM_UP(state12);
> -
> -		if (PM_CURRENT_STATE(state17) < PCIE_GEN3)
> -			speed_okay = 1;
> -
> -		if (smlh_up)
> -			dev_dbg(dev, "smlh_link_up is on\n");
> -		if (rdlh_up)
> -			dev_dbg(dev, "rdlh_link_up is on\n");
> -		if (ltssm_up)
> -			dev_dbg(dev, "ltssm_up is on\n");
> -		if (speed_okay)
> -			dev_dbg(dev, "speed_okay\n");
> -
> -		if (smlh_up && rdlh_up && ltssm_up && speed_okay)
> -			return true;
> -
> -		cnt++;
> -
> -		udelay(10);
> -	} while (cnt < WAIT_LINKUP_TIMEOUT);
> -
> -	dev_err(dev, "error: wait linkup timeout\n");
> -	return false;
> +	state12 = meson_cfg_readl(mp, PCIE_CFG_STATUS12);
> +	return IS_SMLH_LINK_UP(state12) && IS_RDLH_LINK_UP(state12);
>   }
>   
>   static int meson_pcie_host_init(struct dw_pcie_rp *pp)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on BananaPi M2S

Thanks !

Neil


