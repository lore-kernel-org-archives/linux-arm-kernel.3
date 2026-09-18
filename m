Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33372C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 07:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GENi4md1c446ap3YU+8WbAIKW0z2UxkHlaNTGXc/qAc=; b=AOv7HjCk6D+dftIOoz+i7O8CwV
	y/azbx6IcKrjv45fJZBXVKNFmHvwuQo0Hm3nPhyR0x3xa3mW3JOo2tjju2SILTeFz1yKHwSfoPjsk
	6x/N0g0ubxcrCfUmXwEka3DDzE9Z9j67Ua9+5XgJT0EzajLm1DZFPi6W1KX2dVEEohRFMNPeXyE/9
	t1JD4FnaeDmG8cf0Jum6OPiysW02tZsvDbwfjNsHTtjSJ7Q/nIMCBevReW5C1m174x6tgtdt4oDA1
	tnriWmxCwccW5shA1ZxEgzhe/0POLqK594yI+VBk0D/cF86XmsW7RqgmzyTD1pTpR0nMkuB1Ik0yb
	9SlkIIzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TOD-0000000DjmW-27rx;
	Fri, 18 Sep 2026 07:52:09 +0000
Received: from mail-qk2-x0f.google.com ([2607:f8b0:4864:34::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TOA-0000000Djls-2dll
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 07:52:07 +0000
Received: by mail-qk2-x0f.google.com with SMTP id d75a77b69052e-52fb76ef1d0so3992321cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 00:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789717925; cv=none;
        d=google.com; s=arc-20260327;
        b=hAZCTS0ehkToSjohyaWM/XaEGJQgC2YAJPFDYXw80oLlb+SorUQJScoWgjltNVROBa
         ItzNbWwjvHndNKqJnIdUCHttwM1PL+0uIC4avnltGgGCCmenDUUeWsG2y2xpAyZqyHlI
         FHW6/7qGqyBSpldplQcC3H0Mv9QDy43K2GjjhrNYgGS1D6uE+Fotlyb3J30ttgLaq24l
         xVTo5xXx2TsJotgZj5OZWwSk+e/GBbObtbTq2f02aP7z7eY78B5+I4cPGDV10iLDnDpy
         FXYsFenV7rOenzmF9MIuXPjCJff15WICZSUVKrHipNIhx5WzvRkzz96QlAcgJ48FYG9x
         uT0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GENi4md1c446ap3YU+8WbAIKW0z2UxkHlaNTGXc/qAc=;
        fh=cXapT4wULyqU5cD07xx11SJRRomg7X/zLcpxIsIrrxs=;
        b=ZDqSXxl2SmqYRgBVTVfMiuP0kWKQBXX32qgl7cR3jj1RTRGEP92zx2eVTejhPz8l72
         wh/jJroVUtxh6PzhElGUX3P6PSMNOzGZfbS2Rze7whFmE2z+PKecKgLQOzvM+/CpS6Q+
         jpFATdJhq/CgP3L1kRu3DdHjPn1K0GjO9O8w/xFy/oZJKd7u9pqiIVQGO9Uv6fyYxaV9
         tuaDW3JALr1eI4tt1S/q9ZoFuz+Fr8pS5MlG1MFaEdJmwlUnviw2uz/akR5yUxDEJju9
         UUGSPe32fzL5lA8TXMRvPSGdv9euZb2u6AD1wxl3mhd1mLAUCPOSnOHCg8vn+WLxqasU
         gIAw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789717925; x=1790322725; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GENi4md1c446ap3YU+8WbAIKW0z2UxkHlaNTGXc/qAc=;
        b=mOt+zT7M6rLiWQxpsxrP/E6toM8f1QESLulaAPpz3Q4hsQ3Gqexr8ErdIs8JUQbGAZ
         NpMoVgpuIhcMZer1/xLDxbay6xciDR46sPI0fZtqKWh5NcNSn0DfCMUiYJKlYp2ytv69
         pyc+LwjoDthDOTKdk4VcYSbuqU83gh2mz+SC79dQ+oJbBB8kBnvI2B5Pm71gys0J+Elo
         P3Z2pPuMMfZmx5+EEopmZdntGwmo/CMyACU1NpuLs60164tRQPadG+IJtrMzab3+DzOt
         drILUubyx2AmPOjTNd5snrZde8Cpf+o7LvWKH2DP4fC2HdXKEy6MQ/A93QjjkfPbpkOx
         f5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789717925; x=1790322725;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GENi4md1c446ap3YU+8WbAIKW0z2UxkHlaNTGXc/qAc=;
        b=eIC2pXxgMApLeXz2f49CxWNQAKZuwQJL5jQt+L69JsECskZeBs4oOFJjQzpdDhi/e9
         6TgEditfj03JTSzeVfCy2VyzI1QUdvRxpMgq14nFpdxNyB0itg1K6g+ORK/SljUhOLfQ
         9T9kUEtZufzNqy5yiYszsWcR2J7En1ZPcznbRrsl4SzaqxY3IvGcd5c1as+rUMh6Azwj
         q8+5vDQvFvJRTPAfwgLGOoo9SYYcPgDkH7UxHphmXH8mR3PmnlnHg8N5SrFe8SQ1SYIL
         pnSyCHRU5K97pnWve63SveECCwWm8GODNnb0WxJMwDMsLgzmduSE5OrtylMA7LkDruRA
         Khkw==
X-Forwarded-Encrypted: i=1; AKwUvByQQI4XA/3ICdPx4AdvlSE2wkMLwjSy75CKz+bNixhsSCtlEHe4pvZEH1tmK4To8GCT0IWHqGe3d9zcBIkY6zNI@lists.infradead.org
X-Gm-Message-State: AFuF++kAWMt2gmODxswOuxnyFCMtXUv8dH1Jvn+K3h3PvmO8q4QdRIJt
	RkdBvmUghG4LfCkkHKLBzo1QHoCPNGfTvEac5p+ATJK4rF5jqJm+/BeBvjGu/o1sIQ+igBgShoz
	0qcnxHh758PaLe39POpMOw3Dsnxxrg+k=
X-Gm-Gg: AYBFou1kRE+AgRfBDZNEzECIeDYyPANB0mmz2bg7+r4eEaCINRiFEEwFoazEu4a+K2l
	86xAj6lUbeC1QjAjRDVhusSlv9+KPQkTxiZ2gDkF9bbdTbAalb3+1adTdTUm9rDw6xmoBbMlNZo
	3f+2AcGVUclqkB3gpGWpAuv+iLg52LAkIkLiBNjSZo0vHnffjqpAGDwgBGTtjmRnrRjr68qyJr0
	ePw42zFuCB+FHjWwkfjhoVZ2WxODqdxUd6xUKJtbfgenVZi69ISb5UOleGt7i3lKY4d9rLqvjxn
	S0U7tuWlA8SAW0xJRRTGsXtQblcULATpChuxMXngAd3auqU+WlqZWazHNz+nIIX1GBub55sftSP
	7MRJlf1C0zA/15w==
X-Received: by 2002:a05:622a:54b:b0:530:e6b9:f5d9 with SMTP id
 d75a77b69052e-5329e2887c3mr28806961cf.20.1789717924743; Fri, 18 Sep 2026
 00:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260917155834.2161361-1-vulab@iscas.ac.cn>
In-Reply-To: <20260917155834.2161361-1-vulab@iscas.ac.cn>
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 18 Sep 2026 11:51:56 +0400
X-Gm-Features: AcwNN1WPnMYUOHlV-frab_8tJfPEncIhhSiRLeqBqP4mXUOCMzFeKOSH0f4nq-I
Message-ID: <CABjd4Yy-9A0xWCDfZemHOTZDrDdtdO05nUjmN=w=sLwYjzZn8Q@mail.gmail.com>
Subject: Re: [PATCH] serial: vt8500: Fix clock reference leak in vt8500_serial_probe()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux@prisktech.co.nz, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_005206_675617_E037EDFD 
X-CRM114-Status: GOOD (  17.19  )
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

On Thu, Sep 17, 2026 at 7:58=E2=80=AFPM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:
>
> of_clk_get() returns a clock with a reference that has to be released
> with clk_put(). If clk_prepare_enable() fails the function returns
> without doing so, leaking the reference.
>
> Add the missing clk_put() on that error path.
>
> Fixes: 12faa35ae5cb ("serial: vt8500: UART uses gated clock rather than 2=
4Mhz reference")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/tty/serial/vt8500_serial.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/tty/serial/vt8500_serial.c b/drivers/tty/serial/vt85=
00_serial.c
> index 78a1c1eea11b..fc6fdc751b16 100644
> --- a/drivers/tty/serial/vt8500_serial.c
> +++ b/drivers/tty/serial/vt8500_serial.c
> @@ -656,6 +656,7 @@ static int vt8500_serial_probe(struct platform_device=
 *pdev)
>         ret =3D clk_prepare_enable(vt8500_port->clk);
>         if (ret) {
>                 dev_err(&pdev->dev, "failed to enable clock\n");
> +               clk_put(vt8500_port->clk);

The probe function currently mixes devm-managed and manual resource
allocations, with the clk standing out in particular. Instead of
adding a manual clk_put, could you please switch the clk calls to
devm_clk_get_enabled and drop redundant boilerplate?

Best regards,
Alexey

