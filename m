Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB255FD874E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 12:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3HmASpcIa5ux1z3MhV6eeiA+/gxK1vLeVS0bO7i/68=; b=h8qmh0QDUD7GjrfN6GYjLXmmao
	dZ4mn36VJhL33Uzz7mYUAHu0InxGt1URcZaTa2mhMmzYStnPgtTAJ7xnB5ORAD4O7hfeJZffyPHLr
	jAKFCrOk7DzV/n4FiTS7/Ct9JgRvO7qjwNI1EbqySRXHygejx+e1ZCOjUhZDA0hHTt1dcDsNmrcDL
	Ez21Miv01nOmCme7cbrIwW0e9Z6e0gWtye9z7Lzw52LrjaIayRLKFkknmtu+4EGYkGGgI5EMTX1JP
	S+6hA0G4GOQvlptP58X5HYG7I31Htu73lzAHlTSHoDICyrYpFHwAm9sgqczdMhLcO0YFPBZZIMLHH
	7jeQlLzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TBg-00000006GGG-3GAf;
	Tue, 17 Mar 2026 12:06:16 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TBe-00000006GFt-1AeT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 12:06:15 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-66174cf4549so935957a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 05:06:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773749171; cv=none;
        d=google.com; s=arc-20240605;
        b=Ndg676MYZXHfS6nD3v8Mft7IsOzCLxAtSA/APxN+oM06ajuE8sad4ZiAFM+WeInUBm
         WfDSdOOag9bQeAr4kC7S+gZq7t+6f+U/TcSJx4BYmtYLf9n9+j6Ul1S72r3uQuEoNEVD
         WPJl89VP7rOWS1GbRaGdeiF1Np6P8EOJ6bhuTRlw9oIVdEp/5Fgj3mB00RUO38JsDhUe
         RguIP/FoT+QIGEeS8oG7AtUt2X4VPHimiYEnnZ/0jK1FvISsTBRUV3FbHaJrpfP+hSD0
         OzjCkxEznGiIRhJ32ijoZoo4JRTs+M/EdT7rIdOyc3+cblFLhqM199KfPWnDKjDuV20v
         0OOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V3HmASpcIa5ux1z3MhV6eeiA+/gxK1vLeVS0bO7i/68=;
        fh=22wNZ5vm4MYGoQmcI6LlIRIsooLu16e4TOJzUp/kCIM=;
        b=XbXejZKEakiKAQcHhRks6SPZVbpB2p5/Y6IsryG7dMSaxRSQ2WwzaF1RR4r6KfCJpd
         j2E6KHG3oUfdUFSZxaKdNTunlV6c1PFYlI0572OWAz2Cv66kuax2R+Up3Bp8LxaHKhMO
         /wv1p9EpaM4ZauD4T5Yh22W49NKtTVUNhmUfLlD5P2saEgINZRjzlYyF95wcbzKE4hi+
         VQMaewB9w5yS25J9Ai1DITsVd5KelLZPxLTiOQYT1B7+tITKpJkUdqEj9FxIexRvhWTB
         fovrtkvchT6zAHLFhsFZgjEjqJSOn4Xa+nS+ZyFMRvZkR1bX6dMyIFXf1n7ZcQ/DiJ03
         O3LQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773749171; x=1774353971; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3HmASpcIa5ux1z3MhV6eeiA+/gxK1vLeVS0bO7i/68=;
        b=F99tH2MooPswhXpYS8XyuQK4honni1t9T0/nPC/F1w5mTPb6k0U69aTkF+ELxz+QId
         TPx/hvDV8w79Q6tLVMRRupAjw5MzeM8c9fSyQlnzQHoll79aNrVbDSHSeskJiGNKlfxh
         sTwfjPE5/rUJxoP+lSlc2uJswluewDDjmAil1FnR1WScVOIKt3FROfvNOX/CTnIcRp8j
         FMOUluWwrTN71iLiUw8MUh38KCG17YID5zUUlker1blyqQ8eb3lpFItA8xjey5tlGX/i
         YygzelQ0cMQNeQ98YI80A+Ki0vZkjL0s9vkq6pR/u8Mp323HK9rpM0eu1lvPENlymMvJ
         ZnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773749171; x=1774353971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V3HmASpcIa5ux1z3MhV6eeiA+/gxK1vLeVS0bO7i/68=;
        b=O2+N9rfzBw1jAova4REJ6FM8bYeN9S/e7l6jtDYl+sJgc55QtYVLvaTw8yCIbFfLgJ
         qaHwZ5N2mQ7qCL1G+oHOudzCJ9BRZfHXMp9DQRt31hPE3Q5lmLv4zXa2+Rx3vPSxathJ
         RxlVz7QAfdaP8SRuJp+P4ldtjGg/6X1ghfAu8C8iwgrbkSnBPj6AUMrMSxnIJPs6usSe
         UaFKoQwNIuY7+A9zc/LH2bqTodvM4xbML5MXRWGLRY93llPGZIG8ptBt5XtHGwCYM3CB
         Ayl/7CSZnpiXi/0gnKWE6vxSRdMUkkpVPaokKZygnUBdVbe/1wTGNI0YgtTrOnENkc9i
         SyOg==
X-Forwarded-Encrypted: i=1; AJvYcCUbtSnNatack9adOxw4aruu0rNYpct6BujeE/vI8HLAwJO0IGXcEaabWhMu89myhq5D0/q27xfEflwKdSJ8hd5m@lists.infradead.org
X-Gm-Message-State: AOJu0YxEAdnrq+5Y0dunNhNRal3PwONbChOtzZn7ae3SSfNQdIuRandD
	xNQ8UEgPtVarNhrn9PwKKPL2MfDqNDV9UtzxiiiJbWPkQZvgQWdSbam+RFojNJ0B2SWSvSSKN14
	tIz5e5cYaow1J233WeAnRX2P1aQNUkLM=
X-Gm-Gg: ATEYQzxzhvZ4KxTPyTUKoZ2WvLi41vvuJP5en0Nt/GxPcdvD3l2KpVOU7q7oe04JKvA
	NNqdpSSfRHiwuKhd5azjRy4vyzU+jtsajcRkdT108nHpGS75Fs2u9GS53a+pV0bZ9L+Jm0PbCwe
	2FFPpyM8ljeHVUv6HobI3B/WWYbK4HxRj4hvXjw/lLsC3jtBFuy6im2YY+CwMSDp7jwwVERnh1Q
	/gxuQQC6jg3uuWL8+EUpnRwa+0TvSUG5QOWSFI0Ox/ubnCIzsHOVOjgzEvrsRopy4FdmiYvrnim
	HcIPk2BHuw==
X-Received: by 2002:a05:6402:4388:b0:665:3cea:9864 with SMTP id
 4fb4d7f45d1cf-667084b7dd2mr1856880a12.12.1773749170872; Tue, 17 Mar 2026
 05:06:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260122161728.1225583-1-a.shimko.dev@gmail.com>
In-Reply-To: <20260122161728.1225583-1-a.shimko.dev@gmail.com>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 17 Mar 2026 15:05:59 +0300
X-Gm-Features: AaiRm50X5bYR6KKbPpG7gMkacOOuXi9pnRaXYxydKG7ZNhHVXhBAB3-X3-8ex2w
Message-ID: <CAOPX745OsSOuZirpvW5nXDEbjpZXbmXtgQ6zB=dMX2tP+jhgaw@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: extract domain ID validation helpers
To: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_050614_336309_3736E1B3 
X-CRM114-Status: GOOD (  14.21  )
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

On Thu, Jan 22, 2026 at 7:17=E2=80=AFPM Artem Shimko <a.shimko.dev@gmail.co=
m> wrote:
>
> Refactor the voltage protocol implementation by moving repeated domain
> ID boundary checks into dedicated inline functions. This reduces code
> duplication and improves maintainability.
>
> The new helpers are scmi_voltage_domain_validate_id() which validates
> a domain ID and returns an error code, and scmi_voltage_domain_lookup()
> which returns a pointer to the domain structure or an error pointer.
> These are used consistently across the voltage operations.
> No functional changes are introduced - the validation logic remains
> identical to the original inline checks.
>

Hello maintainers,

Just a gentle ping.

Do you have any thoughts or feedback on this approach, or are these
changes even irrelevant?

I'm happy to respond to any comments or prepare a new version if needed.

Thank you for your time and for reviewing this patch.
--
Regards,
Artem

