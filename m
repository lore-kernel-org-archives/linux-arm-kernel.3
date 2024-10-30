Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884E8D5CCA5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 12:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzgcGS1Hf9hdPADay9tMP9fc5ub7cUqD288aa3YpE9s=; b=Vddb07tYOvqJBW1vb9+59rg3pi
	yu0FyH5wnI6Bw+KeZh51C4aIIPD4GdKaGBhB19rioXVbiFQjloH5Koaz5iUidAkKq6Nn6oFKi4k12
	EsIt4suLTMiPpW9eQrLENRDCr1EoRFxXmY5O8ibigXa2BgERcpyaVatcTbQVDV0dR4q8MUDN+Jt/L
	31xCwylqqUwBxgrZHFiUlecCBx/O/L9QYkSy9zars15Wj19OOoN3T7vb5Z+D+IHZ7KAVE1xai7k/I
	hh7w0+sqMibUr/BIMpuoCA6CImfH7s7JM+HEIv5guUQue8f2WZQ/D/vgv/tyaBpLPcGa2eM08VTBB
	5aT3nBEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t67n5-00000000KAT-3xWa;
	Wed, 30 Oct 2024 12:27:11 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t67lQ-00000000JpQ-2KP0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 12:25:30 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4316f3d3c21so60894225e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 05:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730291127; x=1730895927; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SzgcGS1Hf9hdPADay9tMP9fc5ub7cUqD288aa3YpE9s=;
        b=HWeQ3om9CuBO0UxfW+rcyqMYO297R+Oez11dZvW2HcD1ExUKWgrcSsVdTaooqOdO9f
         CtIT25cZuw1Bd3GZtUB3lTTvcElKq9XMop0cTWZ2AUYAhT7jGh+h3Cgbc80IjmYSiUvZ
         xXAiTPkrYnKzpVJww7kD3AA9/UL+ZeWSZbNYeh6UtMqweUhJVBAJrNGmo19A1+d8caRF
         w9S78ZBhZY1rpYlJEgmrf6Y6L+rq6BiiL/2d9jbZRGmTvNbWNBQFfWm1qUH9yz6mnk3M
         Nftoi85yB0bGWTDsyYqMPT/rPEAE+4fk8qckt/I9JkzUbVc+pq15Gf5+eMDPYVNVedNH
         8mew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730291127; x=1730895927;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzgcGS1Hf9hdPADay9tMP9fc5ub7cUqD288aa3YpE9s=;
        b=fPIPMFMScCpWgIbBoZSJsX9K6wodVJAq3cTzvmAtTIt5o5BszeC7y2wm1zJWC5ZIlD
         FPcIN6ezTxtLth4EIqhnv+bfM32IEG7wJ9jVyzxKq5aLUqmc2CNLG1XMfls4nXq2kLJj
         2q07QKrMcap784JIamHJes+dJZvE/m2pvryQjD51XqNlMpB3H684Ltk+Ggr6dill7144
         exRqVIoeLClOvawOSSbQaoXwWPYBZF8Qzp8e21mGEsiniYqCDqXvz5HIBhtmczOrKlJl
         NE+ymQ6Sp9QSi6qVoCy27bHgRj1uRdM8HZQuzwJlVj4jIIC5OFFUX9Q/g9Vw1vX7yjeV
         sH+w==
X-Forwarded-Encrypted: i=1; AJvYcCVYr2R5bGHbBLtY903Kzzxrutr1SdfpuzUgH0nT6phBQPkjHbv8Jh/rXzmf5+40q+XwlL/OdDZfuDJpGRq4hVdJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz761uvU6cikw0w4uQabTF87yyYZJVyOjD2klN/Lq9e2w2pO8oH
	K/vfFZJRI4y85223mQnPpwIRqtXEYzcCqz7nFhS6n4xOAYYpXBM+5lS7RNlXISk=
X-Google-Smtp-Source: AGHT+IHoX4497mSUz/yxsu5fS7Yi5t7HC7XwVTZtKpVH7CT0vNJsNQn5cDMNxHVUOof05fQedX8kMw==
X-Received: by 2002:a05:600c:4753:b0:431:5632:4497 with SMTP id 5b1f17b1804b1-431bb9d1122mr31382025e9.26.1730291127043;
        Wed, 30 Oct 2024 05:25:27 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd918333sm20337295e9.10.2024.10.30.05.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 05:25:26 -0700 (PDT)
Message-ID: <6d3beeab-c26d-4240-b968-cb13d06d7eae@linaro.org>
Date: Wed, 30 Oct 2024 12:25:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] scsi: ufs: exynos: gs101: enable clock gating
 with hibern8
To: Peter Griffin <peter.griffin@linaro.org>, alim.akhtar@samsung.com,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 avri.altman@wdc.com, bvanassche@acm.org, krzk@kernel.org
Cc: andre.draszik@linaro.org, kernel-team@android.com,
 willmcvicker@google.com, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 ebiggers@kernel.org
References: <20241025131442.112862-1-peter.griffin@linaro.org>
 <20241025131442.112862-12-peter.griffin@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241025131442.112862-12-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_052528_634774_92EC03AB 
X-CRM114-Status: GOOD (  17.25  )
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



On 10/25/24 2:14 PM, Peter Griffin wrote:
> Enable clock gating and hibern8 capabilities for gs101. This
> leads to a significantly cooler phone when running the upstream
> kernel.
> 
> The exynos_ufs_post_hibern8() hook is also updated to remove the
> UIC_CMD_DME_HIBER_EXIT code path as this causes a hang on gs101.
> 
> The code path is removed rather than re-factored as no other SoC
> in ufs-exynos driver sets UFSHCD_CAP_HIBERN8_WITH_CLK_GATING
> capability. Additionally until the previous commit the hibern8
> callbacks were broken anyway as they expected a bool.

I think too it's fine to remove uneeded code as it was broken anyway.

> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/ufs/host/ufs-exynos.c | 24 ++++--------------------
>  1 file changed, 4 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
> index 3bbb71f7bae7..7c8195f27bb6 100644
> --- a/drivers/ufs/host/ufs-exynos.c
> +++ b/drivers/ufs/host/ufs-exynos.c
cut

> @@ -1566,26 +1569,7 @@ static void exynos_ufs_post_hibern8(struct ufs_hba *hba, enum uic_cmd_dme cmd)
>  {

cut

> +	if (cmd == UIC_CMD_DME_HIBER_ENTER) {

I verified that the order of operations at hibern8_enter/exit() is sane:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

---
hibern8_notify() gets called in ufshcd_uic_hibern8_enter/exit()

exynos_ufs_post_hibern8 disables the clocks for:
  ufshcd_vops_hibern8_notify(hba, UIC_CMD_DME_HIBER_ENTER, POST_CHANGE)

exynos_ufs_pre_hibern8() enables the clocks for:
  ufshcd_vops_hibern8_notify(hba, UIC_CMD_DME_HIBER_EXIT, PRE_CHANGE);

