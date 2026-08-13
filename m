Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED71C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 10:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+xQTI3Vq8sC9x2ATvB7YIuXwWhZNhSgMb5gkauWI9KY=; b=UXZ8qtRSArCOyemEaGsLuN71Ua
	nmDErCDWUDX5SjC695X3qb1D84Bb5QvCgOtWB+Og0tB0Vih9zGG+OBKhCM8Dwx7qveEiK/zVevn5T
	I1ZAcGyjWn1njp4pISjG4Xe0L+my8K9N7vJBpWSiycvGD2rWVsNejmOL8mo3in7nv8XpPct+lAULx
	nuGPnKsH/eKTV7HEW4MT76tQHqza1hWp6r8CqxJP7yO05FQUwaZ0f/k1aZ0t612MM509nJYhTLLdf
	XpkKr6peZ80YBmFG3H3nIJ7Pn6J9AZpt3+Np4HjcXjnxQNdwQrBs24G3PvXofajrtJnlbY14TERmH
	FSOVtDsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuT3j-00000000W1j-3BGj;
	Thu, 13 Aug 2026 10:53:15 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuT3h-00000000W0J-08AU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 10:53:14 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c1677c91969so65151566b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 03:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786618390; x=1787223190; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+xQTI3Vq8sC9x2ATvB7YIuXwWhZNhSgMb5gkauWI9KY=;
        b=P/iCW2M3FwKFWKMT5iMm1CXX6emp9Igm4iF+uXMzlWLA2vHE5JfFepvM9jugTOCMd8
         ydeibM/8xxdJ3+QAJRQreqDI1trzP4ZKL/y0Lzwn0RzHbZGwE2s4mfq9yo7ohxFLOE6+
         YDT2UWYCdJ7Og0VPln0KHHNFWc5wLpbYFh53KRCc1oZl22aCKCBOse/TgKtLZiWUkVnn
         zo7vjMCIxJnNoCGVA6a5uD3m5We9YbjjIpGx3g4wlTo0wxP5vgQZnVCVu5zJmT3evyAu
         DIsSJZyggJJpjz/n3mAG4xEllNkSxx9vP3HPalutPr+I40SfQ8ZsMXPMVLpqRvdzfdk+
         3zNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786618390; x=1787223190;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xQTI3Vq8sC9x2ATvB7YIuXwWhZNhSgMb5gkauWI9KY=;
        b=dncyoWQO3ITy+uaEW4+5BS/vPSC46s28MfW2dgDZClW/INDWJ5rfUAfqEFNr9bAw1M
         9M1ObjdeKMqurIcoZIQOSxiSK2M50i+pgsNmMc2dLhEn85Ql6UXdPubWFLUxvo0ATg81
         AzpKjplLeZODqiktCLR9M/QrWgF6pUXSeG1D6+69N8oXdhDxi2seYSfNri/kOP6tR7lG
         5geJczvpAkw/vHDAINyfxglIla07nI0Yt0gtsKXSxfc5CzusIF27lzgh6Qbp1kzUtv8I
         7qLCTDuYRGqzGq/S4xlYId+a5jrs1qW3Omzri/hCcLGocQY0Ss3vz4L59mLbdp7uVah/
         nQbw==
X-Forwarded-Encrypted: i=1; AHgh+RouQLAV780n1+YEAsR9Vi1oGnkgbaoaJBSBxRYrxZ9uWcEzmygRrs/dPZj9hpLQ44o1jdeBP4Mm2sGNy/Dr+V/Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv+RVAvw6bLajt5nZkx22J/BYARJQMJfjXOGlr0Am5Yp76HM+5
	zyhH7ZOvz+sWObUQiq2T9N8sW4ac35tfwMlbwRQdDXVay8hXctTSueFGidWb3+z+4vA=
X-Gm-Gg: AR+sD11yATLjXHguQAQBstDsRtwspZZqLQuQQ+BaX5ms7hwEz99HCvXzz1Y8PDKTmlA
	LTiCKAnDGEoCHwjnSH1TQrTXSbOIKS9TmP4cFtjMA1K7sAmu2nwr2edHstHUXiHyCwflgucPx26
	Zl50Rt8BykqYeNaQv52PRIWQFYPo8+nvlZRX/Uut3N5e/ykqRwroIwPJ4jk7Z3vtcTNeeh45dRo
	dVDvRYlTgJMk2Mh++qAcsSPDt4pHhcUNI7yo4A2s9BpXAvRz5vUF1BJrQaRhlc2dK7VIvVQjrkq
	vLYSn8Dcp4bUs+gjZsOSoWuN/Bk13Iu5skuNsdtCnhQg//2s5JyIcV/njACbeQDJWlqpQ/fP6xK
	592Tr6E6fLbLViE+Q50zVEebyo2a3pNGNrGszQMS1ZQkFtjOF/nDvWul31b8ITMrC3UmvJKnIHw
	Zr9LaUaJ6uN4tqTefYHd55rE5dzcToWDI+ZdkmVO/QYBzmNxPCM4rrblkz4dnXwE5Tmi10o/w5M
	+0H9uN5ijKNGK8pbrTn9NQ1U1qawqyJCA5siy5Ot7oW/r3pKsE5HQ==
X-Received: by 2002:a17:907:6d0d:b0:c20:fc74:5dc0 with SMTP id a640c23a62f3a-c2109161ec7mr212458366b.32.1786618390352;
        Thu, 13 Aug 2026 03:53:10 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:c11:afa0:9e5d:4eee])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c211aa04446sm620566b.26.2026.08.13.03.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 03:53:09 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Aug 2026 11:53:08 +0100
Message-Id: <DKNRD14Y6EKO.XP8CIMGJ4RYK@linaro.org>
To: "Jassi Brar" <jassisinghbrar@gmail.com>
Cc: "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Sam Protsenko" <semen.protsenko@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, "Alim Akhtar" <alim.akhtar@samsung.com>
Subject: Re: [PATCH v4 0/2] Exynos850 AP-to-APM mailbox support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260709-exynos850-ap2apm-mailbox-v4-0-caf2fe9a237d@linaro.org>
In-Reply-To: <20260709-exynos850-ap2apm-mailbox-v4-0-caf2fe9a237d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_035313_096059_CDCC4564 
X-CRM114-Status: UNSURE (   9.22  )
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

Hi Jassi,

On Thu Jul 9, 2026 at 3:45 PM BST, Alexey Klimov wrote:
> This patch series introduces support for the AP-to-APM mailbox on the=20
> Exynos850 SoC. This mailbox is required for communicating with the APM=20
> co-processor using ACPM.

Gentle ping. Is there anything else should be updated here or is it good
to go?

Thanks,
Alexey


