Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB2ED2F038
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 14:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1B+ZgAK0ulFf8Rg/ERS29Nw9Z/V30A92LHGwn+CwqEs=; b=hp1Y4SeK92s5W1LmeeCQpwSkjU
	tJkMDKUjINQQnMmutX5icVIrRr3rT45eWOfG0+SpNv72D4YT7uuxmGUD0TsBjrAKuL5gfED9wFnOD
	nY4oS9DGep9aCikez5lWWzfz9QI7s2JunVg5kWQfmwwb4kZISqWQ7bhLVV9vmp1upraFatx3bmPA/
	20Siv5Zi/gj33HrEYsy4/qeKCJEOiApZ/lix4i110HxN0LcSa/tZLb6GplRww8zQnSn+CWH9JItth
	hTCtVoYE1Hlf8e7k8m8FytyzPJ7gHU8NQjNqKQJR6mqnZnQrQXpWVKlX5knRmNdmOOaDV/EtZQTMF
	I9J3uLIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkk2w-0000000EOLR-2q2I;
	Tue, 27 Jan 2026 14:27:58 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkk2q-0000000EOJu-0FZm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 14:27:53 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-59b77f2e43aso7759529e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 06:27:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769524070; cv=none;
        d=google.com; s=arc-20240605;
        b=W42Np+HdoEz8644+9pGdxglmuPtkVrZxcJvPDULy1V9ZRKdsPKEPu4xULPWmeKc6CQ
         ikkaxRBG4gCm+RvzA7xtN/op7jpCYUAvorOEaGhukB94X50nU9g+oYUOWBLT2VAlzvMB
         fcjKpr9SxSZmVHdwlRyhnQyqag7IHv2p98RmMGp2syRYO/TbMb8eSYmAiEbtY+ajSqBf
         ulK+wls/Y1LTIvcRn5XnnovDJ1dcI+ShZGweMLjgMvO6KaYBbxRTkLq3hL2mWsDEutIx
         c0imDvOaAYIopLtnXEOeDu0utTNOhCm+Is8VGUxb5PFUhPKZqgRzxefJ3oMNR0goy4Qy
         WctA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1B+ZgAK0ulFf8Rg/ERS29Nw9Z/V30A92LHGwn+CwqEs=;
        fh=FEb96Z8QZdjHgnMRR3dCFnQCCxLY7rDg7ZYdCtgadFA=;
        b=k5i5MM9ymVT0fexDya0cW6HaoYB4RXpdc1NqirY7/v8SX2use8GRbZY9uj31aUFt6w
         +EltroFNDsI25gN9q2/Rd9duQBAyEZC6oDDTIAw9jOhGYg2tdPceMYPeIQrbj0egs32q
         bvsA8l95FwZyrfXluU0a+/nOelItzT0hXH7dQnnSWwxMy7zwTav8jlI/VCsAHmTErMbB
         PL3tmrEP9pDimNv/si8N+8LsDy1PwJf5XWhWswX8MyjyPOaawMCHa4llDb/J/b46gVIH
         06eF2k+5fm9TZzRoMTkMrjYgcxLT76SLd6pF77ZdUq/asd2BZUau/iUWAAZBa2QRpprK
         VlWA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769524070; x=1770128870; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1B+ZgAK0ulFf8Rg/ERS29Nw9Z/V30A92LHGwn+CwqEs=;
        b=OwY795XfEqFE+PF3BuJ4+RYqH7+3UOUPqnfaTRyEhqTbZAI0gJVHtX63ogS2EMRQ4p
         J8GNke61Llo09FLIQuIgMOqlJaGcSohJksRuAQmKdawopo/FpSK5KzpA21Ka6nIFOg3U
         jQrRAJStnAWNlmuZcw6ITzMRTEUotGYHAZ3gxy3x3zBw4xs+Ntrvr8WueugpQIfdD3BG
         jQdBQ06hxZfVgXfFq1kO92Y9uEBj1hTx72XeEABBWGYq9UcYvfMAB7HjyLi9W4blzB0I
         vreZsifOFrHSqykx8DE23MuBqTyhRFJNRtkfPrnB9HfJ7tcB2I3WkQ36loqpMXdk5f/D
         H06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769524070; x=1770128870;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1B+ZgAK0ulFf8Rg/ERS29Nw9Z/V30A92LHGwn+CwqEs=;
        b=BpbkcD7aLkWeSXRayaugkEiRiZJMtg3q7o7+QYTHv/DGMj+jkAikj9HEE3kHCy3eJP
         woOW7vKQskstQBAmMQXgdzpcy9Nvg5n3njj3QVBy2jFXn5kftf2wOjyWvooHFDSTtpJj
         OgqE2MR49cCPb539f5ZQhMuoxSHNCHHeOjP1O0zPNOimoB6cGTOgnrTvam+8QbVJSZSf
         gscShDz66cbzWm9PNKf/9GZTSJqOMGIMmdAuifeGT+aMKPSuO7j2yXUTS9TBY9pSIO15
         a3gG8BgcA1tQEJ0MX5m2bsFKITJjXJEEnUjXrDX/xjfBkSE9gaXS5v+FxwMryc/8U9S5
         WUCw==
X-Forwarded-Encrypted: i=1; AJvYcCWGaATvOu8dxl0d77zb754lVIJxWFkE5coRdFsFWfzYtHxAGSbZgcytSBwsEAfaWM/wl0YvZNoi0IWfUpc/xFfo@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5CkzasURpF59i/87sK6iaQU508YSaBDp6Gk00MeWPcEvIYXDy
	HS+fy+lo64pSxKMKVpOFVXI9qDRzCqh5g6M+xqNXLkn1pAsrZAnzssPylCJpnQM4tB8D/b5U5bq
	Pp3Hl9MN9lePgUYSKjuJdEFoYZB0Tq8I0JwSWj6oPog==
X-Gm-Gg: AZuq6aLknB3XdQUVuxbJsPpIwjhLeGqVJrgN3rImFKcoaETe2mRiZGhzC/EJrwbKKhv
	6u68tfZecVDqF7/nMYo0HogWPt57Hcbz5NhbXWUdaZ/0m/Lj5tle11pEaTntO5oUBH/pk86xSTn
	7YWHRmXQQPbAaDLPdeJeBsPXZ+5Q1BcpMM5LfdLnUpvzJf2NTJNYw8Zb/xKUUdDJp2u5+afm4EO
	oGmtfJkKFeHSY6VltTwEil23j9qKAR3erdnjOiHFsBiWd7GOZySnIE71HE18F5BXgFioFW8
X-Received: by 2002:a05:6512:234e:b0:59b:6a9c:530b with SMTP id
 2adb3069b0e04-59e04142c1bmr857103e87.26.1769524069786; Tue, 27 Jan 2026
 06:27:49 -0800 (PST)
MIME-Version: 1.0
References: <20260121-b4-scu-pd-v1-1-f993e4082089@gmail.com>
In-Reply-To: <20260121-b4-scu-pd-v1-1-f993e4082089@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 27 Jan 2026 15:27:13 +0100
X-Gm-Features: AZwV_QjMAX96nvdaiHP7TCZjGVMhp0ccF964SK-rZQQO1W4Cw8JdkkpQ3MeW438
Message-ID: <CAPDyKFr+USco=KMAnQWz8J_VkqftYwKFV9QtRN0vyc=ERJK8ew@mail.gmail.com>
Subject: Re: [PATCH] firmware: imx: scu-pd: Fix device_node reference leak in imx_sc_pd_get_console_rsrc()
To: Felix Gu <ustc.gu@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_062752_123977_D4282014 
X-CRM114-Status: GOOD (  17.66  )
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

On Wed, 21 Jan 2026 at 15:17, Felix Gu <ustc.gu@gmail.com> wrote:
>
> When calling of_parse_phandle_with_args(), the caller is responsible
> to call of_node_put() to release the reference of device node.
> In imx_sc_pd_get_console_rsrc(), it does not release the reference.
>
> Fixes: 893cfb99734f ("firmware: imx: scu-pd: do not power off console domain")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Applied for next by amending the commit-msg-header, thanks!

Kind regards
Uffe



> ---
>  drivers/pmdomain/imx/scu-pd.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pmdomain/imx/scu-pd.c b/drivers/pmdomain/imx/scu-pd.c
> index 01d465d88f60..3ec33667a308 100644
> --- a/drivers/pmdomain/imx/scu-pd.c
> +++ b/drivers/pmdomain/imx/scu-pd.c
> @@ -326,6 +326,7 @@ static void imx_sc_pd_get_console_rsrc(void)
>                 return;
>
>         imx_con_rsrc = specs.args[0];
> +       of_node_put(specs.np);
>  }
>
>  static int imx_sc_get_pd_power(struct device *dev, u32 rsrc)
>
> ---
> base-commit: 053966c344dbd346e71305f530e91ea77916189f
> change-id: 20260121-b4-scu-pd-257a9a40e84e
>
> Best regards,
> --
> Felix Gu <ustc.gu@gmail.com>
>

