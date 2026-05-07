Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C75CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 11:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2t++Big+xUoAOFwEvlD6LQmlFsv/9Bm6ONnqBrqhXfc=; b=1GncBnWiQMtJQl8Cy1/b4VD6/E
	OVyZjrJQmNsM1urZuHAJBjHFUihQceQcgBzGg7wKbQjsba72lWNWWNxLIyTBxXZCTl//2ALtyTdjL
	gSvPrLW0zTXSxEr+qgbj4bWUHtMUofQb/8QE/gH7N0/gdn1AKSjsyITGcHb2kPlHxDNgpfGM+059P
	Q9cZLbfcjJp974KIiaGKLRRNc+58p9CvZu8gmcFcFQn1kGCLAnIXl206Qo1/la4AReWvJwsiLl+WR
	kJ6RCJz4lktSBb2zCHZtlbicc53n/v+LvXwUJq6g4uXLRNFAAAcY7P6ZLdzqUJot2dV3bSJf1t5tS
	Kolqv38A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKwSn-00000003ZJl-0iYz;
	Thu, 07 May 2026 11:00:17 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKwSl-00000003ZJL-1CfH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 11:00:16 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6763cc8775cso3372102a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 04:00:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778151613; cv=none;
        d=google.com; s=arc-20240605;
        b=QQDh25HCNfe3NlLubgDozb7GQ0TTXj6tw8cTDgniz65CMB0Zh0+HWZoLx20RnKzY/2
         SJydH2WCfL4vAhg0XdSIINwuoAXkzNXc7AXmlRrHTfbTNkPMSPr6D68wKHW6dp03twjc
         /w77SKFZbGaAFpy2H15WtOawML2RBLaKfuAVVaSVweaG0BbuZyjXGYXuB4lJuZsuHYMd
         wnvbWAsali3y9VdoBOFZ9K3t2jz6IWSeA5UEKV9Rv+JekEs4B+7TvckHENmyRMRuj/NR
         4wV5AwY/z7vYUX0bQvsr9YDHXFEDC0QwZg0VmhvMb4JLJfPft1VQ7naYPqmdAjAnbIb1
         V7dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2t++Big+xUoAOFwEvlD6LQmlFsv/9Bm6ONnqBrqhXfc=;
        fh=34u+gKpfrtK/xKk/+taqOaB4QoqH748y3q3mw4W7d7g=;
        b=OOqEEXKY6wIp0hzc6r+Icop6vdrzUhKndaKEJWat3WD/5HPdUckd3RwemJmtqeTXaN
         k5MAfacjRNOUNOuF100Z6bX69hcrbAGxaDTdcMs1JcUW/5C+mN8F/9CgRVgyZQjkyOTQ
         AcVoA77dpbVQFil0YoVF6ZM3gv/R8VR9o2vu9C690SvDsQk+L0ySSrh0ByBjDUUNdjhG
         /8tASRJtyNakjnGg/qY3G6S2d4rGg6w/w+DpLxyY8WDjExtlcFRK8wX1Q7ro1wTDDntP
         Muxbq5L+VBR5aIba+AS+CKHI6EHZZXCX8h/48iwlRN9wosW+EdnWkQ3t8gyNjEFL7jTn
         ezlg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778151613; x=1778756413; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2t++Big+xUoAOFwEvlD6LQmlFsv/9Bm6ONnqBrqhXfc=;
        b=Lg/juRfPmCEq84tpUfD90xwl4bD4vUs7S+OVPalHL6WssP2D81kuVMeUwK/r5jvX0B
         Xv1/38SUpzahzCKvobCnDuyBwjIB+lPvP1zPdHONHuvqxRUjz588RRNO6pQsFAxjR/8v
         cQB+Kmt1ogdLn09RIe48wqJ7s8+BfcrYZ0y6pRHsHPq09vkhozQcQzagIMeatPdAXTyd
         DSluGDG6hwW9WjraDnwqRJOzyUUDMc7nMvNubtBuvlcPqKza0EZaAAUG+SI2GMk3PnN9
         B577QwQnzoGgAsisriH3g0/CWZE25oaqqSmGDoJOtSwOX7fjvTdawWrBemK/zWQEE4AH
         RG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778151613; x=1778756413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2t++Big+xUoAOFwEvlD6LQmlFsv/9Bm6ONnqBrqhXfc=;
        b=UU03o0p/Gcwed84n5A/umNelwJEY8Y2oy4Ctt+VWNNjjHr8jmWsIEuHhMh7FVVEOyB
         LIlhlYrefUXhKvpJDPgjhSncxKqCkcjF5/4t5c8fFMxNF6yPJ6gKQgJeSIMTasgBTLtZ
         esF4D2jzVYgeRjbDt27BXiJ4s8coEIvFGfOkYehLMssagEtWkOlFF9nDGaBWDOM3x3f/
         /OrH6+4y2/G8NLQuQuq0ChLMIbBh5ewu+r2hdNzT2n2JP4RyciHJ7ycTiaUUkmy4xrGW
         9euq3bgE8+XQR/l1Dp/TKqB+7bkys6VS97zkXUE/icg12g4XSi/z3iEGPfBOLw/nM/n0
         kTaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8m17NvnxK1w7VLxAGiDEmENLfudTyWS1aoSV4vgE+OBniEPZ6SJMcdGs4Hr1DapBS6vjLzuXNMBeKWG/j6Kztv@lists.infradead.org
X-Gm-Message-State: AOJu0YwEyW+OuosDXtwQ1dKZOKepFOdzrysC3FT3P8/kS/iWnKDw9Ofy
	w0olVWQK3jYzQhyTxzJyYKYlOZRxp28BeWsKmu/TJhAcVlQt+AbmgxddqmWaS48YumsFW+jbqCs
	0v8WQyowYRoM8J8A4y6l45mGHbsJ8TyhrqmgkEQjbrw==
X-Gm-Gg: AeBDietZzuxley85CvWg8ASpoATrj+6OCxOUsmbmgl0lYl4jNGy12cyRgWAPDkVeJeW
	ObpRfguTVDGQAu1J17ufGhKUpR1wnAQKghbjmageiiePdt4g0xT/XOcUYUzCgtMnu84LnBkD1/n
	CVzfhJz79i4bbnur99mItPc58BRmAGMRmfgb+1YmXJ3Y/fZdB+SnwolBe8rAhNLCJuXXslMqkWy
	cRoNf2etCmjwKMciYp3lrtbNMzwnwV8UoX4+7qe6htg5vFKkeQT2eeYE1nwyQBiKFa5OsQatEbF
	fuYL2sNx8Ez7HnrvY3abFeiK6DqQ7jJu+tZkm3qGHxZUgcfyMEQbpJfZloqZJw==
X-Received: by 2002:a05:6402:a583:20b0:676:d851:447e with SMTP id
 4fb4d7f45d1cf-67e0dbfa297mr864649a12.4.1778151613070; Thu, 07 May 2026
 04:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260429-exynos850-ap2apm-mailbox-v3-0-8e2719608c46@linaro.org> <20260429-exynos850-ap2apm-mailbox-v3-1-8e2719608c46@linaro.org>
In-Reply-To: <20260429-exynos850-ap2apm-mailbox-v3-1-8e2719608c46@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 7 May 2026 12:00:01 +0100
X-Gm-Features: AVHnY4LglSrSyhxrD3_RZ-F9y2tAHPw4q5NwDa0ckqm4CO9WeIJhM2zzkB74KAY
Message-ID: <CADrjBPoxH8ZguPMygP4X_DDC4PCbGu5fR4UnfLV1Qd=UKQ5yyQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: mailbox: google,gs101-mbox: Add samsung,exynos850-mbox
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_040015_350438_CE37EA39 
X-CRM114-Status: GOOD (  16.00  )
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

On Wed, 29 Apr 2026 at 20:00, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Document support for a mailbox present on Exynos850-based platforms.
> The registers offsets are different from gs101 mailbox, but the
> workflow is similar, hence new compatible.
>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
> index e249db4c1fbc..c109c1f7af24 100644
> --- a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
> @@ -20,7 +20,9 @@ description:
>
>  properties:
>    compatible:
> -    const: google,gs101-mbox
> +    enum:
> +      - google,gs101-mbox
> +      - samsung,exynos850-mbox
>
>    reg:
>      maxItems: 1
>
> --
> 2.51.0
>

