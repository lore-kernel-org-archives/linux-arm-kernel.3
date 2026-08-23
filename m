Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85CCC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 04:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSqjSSah5KBgALutr0hY72c4Zb4Ws8WYQo3Q/l3ach8=; b=5D+APQPKADW1dCvimQlmLmUqz6
	HfPbfw8JzV734QoL9KbaAGZZBVnsHdtB7lB6mlQTc6Z3DJ0OZ3tdiTO1pWJTBgiMNhPhQ2W6TM72/
	FBS+cs0Jn5+6Ue4aaq2gSJ/AuKt9O+1fOgqsNL7sBkoC/JMbdcwuAbsTvIBq0JGyW9lYKW/DxOsLJ
	4X/PHlh97asa7Nv7gcHyOW+M7N+IO9IrUUsVgxIWZG5iRoXoVLDoypYBY164Jh1IhfyBHQNu01mtU
	3esFiYnq0PQPL60juUp/Dp3cjt/qaOhkQzIdnBVGGW/zoOfNPi/iLEP79j5qBXzyhiry83oJU+Xnj
	t6p5WUzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy04a-0000000F4GE-1Ekl;
	Sun, 23 Aug 2026 04:44:44 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy04X-0000000F4Fg-2aJw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 04:44:43 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c15d111ca99so273699466b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 21:44:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787460280; cv=none;
        d=google.com; s=arc-20260327;
        b=P6F8f60etZJgps9/z4WZUQzg8Yu9zht8GRMpePhydD3jkGb6YVeBUzvaV5lizlYVPp
         S/JqLMDlGS0pJ3BbfdcDxZuSb1lDVjip5ojuD6jVn1DU6c21YJNaE67ZF0MwfaE+7MbO
         dsiBu6Gt3t+kJGxZ9HRnJ7Wi+0PyGuaWvk84DGLfcN8pLkvxrRq8mzckASoD85DT+uPV
         L+lTgM0UU2Gg1deg5vFTB0zMMdC4b6JshKdrJoGXad5pKxTuIhuPCCZZZ6KkcndlAqB7
         bKeDLQFee21KUfP+finc6SAErEmEqctlMnlEf7DDvVb80U0K2E8fh3bfTIeGNnO9EWfC
         OM3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZSqjSSah5KBgALutr0hY72c4Zb4Ws8WYQo3Q/l3ach8=;
        fh=FC5BwoAVkt3n4GMpJKYQBLTHSTHnnYzLNOu+EiLuXCI=;
        b=m9B5yfDonsoUFUh/z9+HlbjlWvEFJ407uaKdkj+Lc3B584PjoemdNh0Q19Y8tffCnm
         cdVoicr9vHxX/bg/lw5Sav538K3I/ZnFMoUa9NUkLURDN9ksBdQbiSNkh2S1u+gIMOb4
         aSxblgEnpXWwBNcy9Uc/UD/MiOjOJfwNIuLMuU0BvAweWv0KIhltv0Dj5G0pKe7KqLm0
         0EZxTg83df4RTt5kzK+aKWcfSYwdU/o+ORpSWEfMRrZM50dXZpyDAHNDnZ3iGRITacli
         zi0zyzFoioD2pBGefalZ/QIRq2SUjxxRjJbSUEtzN76PgYDzVucK2PTWlpU98AfBKU9s
         0+qA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787460280; x=1788065080; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZSqjSSah5KBgALutr0hY72c4Zb4Ws8WYQo3Q/l3ach8=;
        b=JYvp32GEKZ/I/fkiu9Tdq8vLwTbEw5gCE7rCD0DaLQ2RL1wI3c3k2SKo603Ij21jo7
         6esNLMrwWzSkMR/WUNuLny8pSIeMbr299V6UBaWU/ynt+PWqW2O2nhb9ekU06VzwelYT
         2ddGktv1RIKSWlEhVS88DXsY8iTk/YcmqDuKCTavSegBUcFCJYOTxcbIM18sstC6LMWe
         7i5SONM2CMaZLOXUPlCHW5N7LxgXafOsQCximP1gDKr8T5MH069HmqmcXYqRrjcmRvo5
         kpB6cNJPgrGv92VaMPP7C7yreEWihGt97e1fPNqsnRrWFj/se3r/KBI/FknJE50U7RfC
         XiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787460280; x=1788065080;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZSqjSSah5KBgALutr0hY72c4Zb4Ws8WYQo3Q/l3ach8=;
        b=FpaLxG5v9azxaKkjnIrL4LJTkzov7UL8TUT7NQlhxee2lRpVk1UJuvNLrynmq7+KOg
         QrGosdTtnCp5PThTibVJg6zV0dukNukaRjcfRypwqkBUSAhn3t+qgYYN2S6+eaRdBbdX
         8fFyiE17m4HMW5DbEryuPF+98iU5BDceCckJJeThaqFzFUQKCuEYb6jdnGPwWaV6G6hg
         iRejc2vr44H5DSQnHPxXMzkPMIcMdSSpY7DMTdRFt2IS52jjmD09Tg/lBdwQSfUTFl6n
         Rwp6vZWDxRt9z71v2WXvK9k9W+lqyYik/sZyjuTp0ZDNMqCDYxpuK9A+7GS175Zae5JI
         A1Cw==
X-Forwarded-Encrypted: i=1; AHgh+Ro7bnql1ztnhOWqK91K4yCGB+rGsDjHEb34JQ8FXQQYUGIBh1cvE/fnp2FNd5A3iIQ92YtATzH0LHYXEdl0KcFA@lists.infradead.org
X-Gm-Message-State: AFuF++lMAVeKkV2LTE9GmN2hS8wAAwCiAX9V4c3k/ZGzxljmGc4PFyuK
	aTN0Nxz5x3x4iLRp82rP8kUg0l927whQqx1WjXdmqeiKRf29l/lXCGvX2JS9VbdC9PDqaWLKn9J
	/Eh+bjkVNLFBeuZBCnUhPm422NT/1WpA=
X-Gm-Gg: AR+sD10v3eXl9xA+hvvNiKXlF4eezscXsTu3gNirxHwobswxhKMMGXc9z40pRDPTywh
	EKzse3AeO2tEsg9hzps3zab8vhI9OW7oEHuYhq+WsNC1F2zcoOz3Fd6K0dxMuehwXojVNqYIzQi
	KRqENBvcY2Yhl609mIl8bAuslMCh6UvTAXjq4W3XCim0GbzptNJwLl94zlFuCsnoAZQ7H+lJWo7
	kqdhTu7b6PlvNIrCt+SLusSYBRulao9WKvM6PCp8BBBWlV9r3xz4pzH7nX8LteRFduqivHAw3p9
	T9UY5ryMb9YhHOlFuwPaKVxmOYIFd2paLBJw/FXkdnx+96mqIY2YCFkXZV0HVJY4SiP65cyslih
	xxlwmtFcK5KH3BoB18YwDlHqD1G5hR+GY0FL4fsrEoCs5YMKsmAwPER4Ije2KNySajdHeOcHTbn
	pooE5qxc1xBCRh0SQl9zMibJtNJJLmTWazsxYrbea9de9ed8oCMr/ERaXz
X-Received: by 2002:a17:907:8990:b0:c20:3679:a2e6 with SMTP id
 a640c23a62f3a-c24925eb3ffmr1126262966b.10.1787460279494; Sat, 22 Aug 2026
 21:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260504031209.618949-1-rosenp@gmail.com> <20260506110910.su2s6ncsi2xfdiwm@pureblood>
 <CAKxU2N8PUdxo54oHtcroqe+Q88k0obxPg_9OCRsNsoOwvcS25Q@mail.gmail.com> <20260630123029.ozveska7eoenci3s@unturned>
In-Reply-To: <20260630123029.ozveska7eoenci3s@unturned>
From: Rosen Penev <rosenp@gmail.com>
Date: Sat, 22 Aug 2026 21:44:27 -0700
X-Gm-Features: AcwNN1WOqpjNvvrbFuuZdDr0EWOQvQOz6eBeeTVou_Zk_7DEeqlQ6lYFj7PXzJE
Message-ID: <CAKxU2N9wE48D2WLPvta98kB6xXciOdvpOzgGrnS9kkBHYfUwXA@mail.gmail.com>
Subject: Re: [PATCHv2] firmware: ti_sci: simplify resource allocation
To: Nishanth Menon <nm@ti.com>
Cc: dmaengine@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Vignesh R <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_214441_701008_754AD2DF 
X-CRM114-Status: GOOD (  11.49  )
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

On Tue, Jun 30, 2026 at 5:30=E2=80=AFAM Nishanth Menon <nm@ti.com> wrote:
>
> On 18:42-20260629, Rosen Penev wrote:
> > On Wed, May 6, 2026 at 4:09=E2=80=AFAM Nishanth Menon <nm@ti.com> wrote=
:
> > >
> > > For some reason, replying drops the CC list. manually added them in.
> > Found the issue:
> >
> > https://lore.kernel.org/lkml/20260630014129.1548147-1-rosenp@gmail.com/=
T/#u
>
>
> Please repost with additionally CC LAKML and the TISCI maintainers for
> the patch, this would go through my tree.
https://lore.kernel.org/dmaengine/20260630013917.1537819-1-rosenp@gmail.com=
/
>
> --
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DD=
B5 849D 1736 249D
> https://ti.com/opensource

