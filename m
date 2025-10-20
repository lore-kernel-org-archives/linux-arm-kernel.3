Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D60FCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 20:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3lZxJ8LZRt7zokp4kQuaYa7ZIlO7H8mMjodLLMpmAE=; b=j2PC9CpkizC0zz0urHmkSxTaFZ
	VNqZcl2sge39G5EFG/E5tSeCn1btU3Ts0RYPINWT7Co4uF2LFhdKjQq3GOjfiwEWYL+88qjf8xNvf
	8tSdRyobWK/zzkjkjb09uPenzKiS+gnJ6A6fAIRUr1DNUkniPFWCThA2+gyWYbaoN+0PNR7AkzQK3
	yDMJLZS40Tab5QydkNXLrgoroAbdC78vwAKOMb9vYRb4yuE+F0VoHQEP5zexZNaoQ8ubjrhQKzUHW
	0wllfWtQDz+2hFqCCG9wR2FnI6o2XfoWztF7UFKfYEsFWdZdF1v5oGXyX3UNG/HQBdwqB0yn9au9b
	YKT+6H0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwxr-0000000F00X-1rOo;
	Mon, 20 Oct 2025 20:58:47 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwxq-0000000F00D-3Epd
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 20:58:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=l3lZxJ8LZRt7zokp4kQuaYa7ZIlO7H8mMjodLLMpmAE=; b=vpOZSYwC9FCqdW/5sbsg337eB/
	o+XsIUaloYZj5Ml1quuDWni+h0xw8N4+5DfPFoMmY7CIFEKXlVq7bqTpZQw2Dip1KhH+4/or2nvq7
	HqJCHmnelh6rA6vTfJhioPwP9Gz1UAWy5F1WzYacN0Aq0tP/gRrL0kwR1lbAoEVyLTsBCEl0siEKJ
	H0bFzzl4cpTbKQhOe62czEKd1Pe61qPKtJxgw8MDY01LmA7rdv5/wS5PNTM2OWk2QSved+E7JlTZ0
	XV3YsiFy+t4ZsROSPg97xk0jqbJZTMPZcR0tX98TiJKzpBz/S7A444DmgRXZjiJPlLaKEi+vEAYXK
	1LWFBn6g==;
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwxm-00000001n7i-2hg0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 20:58:45 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-36ba647ac9fso43127651fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 13:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760993921; x=1761598721; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3lZxJ8LZRt7zokp4kQuaYa7ZIlO7H8mMjodLLMpmAE=;
        b=ENIuEJYdD2iC97IE/E4GahkfuqJ5HyVBr3Kvxd/egBCefrsqd0gq6p0Q8MfgmB0c5x
         WK8GjR5XX63pTInMW4jD4ztU/LpTyAPMS5enSOaXZ9ke0QekWPDXftAM3q5b+fMcP8VS
         0h7hZS3r8ryYRVn/395xDHtdq/WB9mynQsxc5/3Sx56Y/NYhmFp6wp0y8gbWcO3Jcg+1
         5TnDid+RFIQcz2X1RzdQ+I5VrOtA5cmGUuX7MeqEI8gLUkcDQA/X89I2rbMympvMXXvN
         4CK3W93lugv2fyN/+2wblaIeZAvHS2ZGLO4skTNU+fsRu8RTHAvnDjGKPzNoq6gOBz8e
         vSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760993921; x=1761598721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3lZxJ8LZRt7zokp4kQuaYa7ZIlO7H8mMjodLLMpmAE=;
        b=j0GAySkUlB8oUTxgFxRjRFtEwyD4f2XQeGZGLlemjW4P6m0MmjZz5te/uHWcfpWQwR
         aLbxSrUmooPtGyfY4RoEGG1fI3DIcfusVy5c3p5QPr9fGjwbpLfVFejG+/0Ksxaz7M3l
         C7KLgOKoSBe5ThlnirZ4FjuXMWvOyoiTM0g/hZjDmqD3C7y8coFoEIQy7u98BuKcyfYW
         r2DqtpZwMKgGWCWFpFOdWvk3R9WzAEUXBIecpvnTseFFvEuG0YfVbUZ1s4BP/im88AY4
         rj45Af1ZDXafsf+G4BKNrM9vOMHiYeHMUI379Ij2UhhXXheJA9sOQluJFaaaZXBSRcPR
         MwEg==
X-Forwarded-Encrypted: i=1; AJvYcCUfWNByHPL5cd+X2pp2yVdLr/WYvf/MHDeEvMOO82edANO5548Ytvcx+AYDfPjdin63WITx5m5XEf0K9tri+drV@lists.infradead.org
X-Gm-Message-State: AOJu0YymcW/aed5O5WZG+kVh0Df131pUsV7iUmxmnJDWUptcobKWcIoV
	8bmoWbW2zwvqiovMmDGl96Z+tQL2T0cQVQO5qKdBYJTXx0EzR+YVfyoWEPGQIBeitA2iOJvQuZx
	x5jTVyBRdsf2b+pXW4ctJE/m8NO0GhZ8k7sDqIEsyzQ==
X-Gm-Gg: ASbGncvosisQv1OMvqHRXcZG32F+oxtK4ZJUUQxVp4GtWfhsD/4TdCRV2IZJkmLAeW5
	+XHXSNxfDFv4tOaeLpw4MvWNqusH20k7icpy1rZRa7ifWCHB8UMJJkY8Ql3zE+/ZjVrgtrG/2am
	Qp/xVFiVqpfAdDRETV6pR3pM+8WHohO/SX0yXnKUbjwJKZZaGQGngB570k2vPIFZMjVotFfqCnR
	YOGoNmP8TJywv000dE2Ct+OeKwe7y6QnStXvmazH92VOG5TGfsSjMqCugIe
X-Google-Smtp-Source: AGHT+IESlrrK+D5XHA5lrAtuF3QlfvYzPMpNJcOzLYtG5TeUOwa/oJlyZIePwgIJZ8sArPfbw2eN7GwsiOCsU5SJLuQ=
X-Received: by 2002:a2e:bccd:0:b0:36e:21a0:f212 with SMTP id
 38308e7fff4ca-37797a3b30amr47334921fa.29.1760993921578; Mon, 20 Oct 2025
 13:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <20251013191235.4139259-1-robh@kernel.org>
In-Reply-To: <20251013191235.4139259-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Oct 2025 22:58:30 +0200
X-Gm-Features: AS18NWCPfd1MN2_FI_xXjIXan8SG6Tbr5kEprX67_1-EY5u7nUJdishDZNpf4qI
Message-ID: <CACRpkdbduyWoJ7ob55btTwkCSQWDB9_ZObL3osLVYgiuB5Lk4Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Convert bitmain,bm1880-pinctrl to
 DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_215843_950392_C83F9BEE 
X-CRM114-Status: UNSURE (   7.10  )
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

On Mon, Oct 13, 2025 at 9:12=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:

> Convert the bitmain,bm1880-pinctrl binding to DT schema format. It's a
> straight-forward conversion.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

No comments for a week so patch applied.

Yours,
Linus Walleij

