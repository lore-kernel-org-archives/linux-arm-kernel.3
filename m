Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736ADD4415D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 09:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HqEG+nZ1xiQN6AJIt2dnnJZEHC10sC0sNx6sFrPvEsY=; b=blsgTT9lfOB5eDkM9iO0e+izrd
	SlQCxmFv2c16hnN0Wn2TL4VKewueZP22wLuvIgKhYMxDsgPi9xWNEC8IfRBpAp+8qoYQwB/4BBhz6
	g/Tpw0Iygs3HYUtkRtqjaU9bBgAL7q5dkItW/VERO/ddkXVpnZuRaalQpqtRaV+X3kSIYQxMdFbPN
	FIZh6T8LZwvay2lwoWIZikJAOteaE0lztJmTJsu5NWKxlOavhxMw0qfMa6RDaiAvFhEz4CphgQFfz
	qxREFJGPhxabegXrx4xBM7zI04kGyGLtaBHGYY93iF4Y4vGL5yJuH3LHo3PVMnyHyKI9VUsqKHeD1
	ByV/fJjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTzrH-00000000NbQ-38zt;
	Fri, 12 Dec 2025 09:54:43 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTzrE-00000000Nb2-48SP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 09:54:42 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-bc29d64b39dso648167a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 01:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765533279; x=1766138079; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqEG+nZ1xiQN6AJIt2dnnJZEHC10sC0sNx6sFrPvEsY=;
        b=GS4bykccyDjZchCEwF1xVJbflihZ+Db+KD/WFWBo+jGEDRYQ6FjsjsW8mwk7YWeo9/
         xEtVU2LzYcqMNsmvbZFr50phKq6dGa5sw4S8MZhFRrQgu1YmnHIC6oxLBWJnP5ZvQDUM
         EkWcyxSgVO0iwLu2pfU62wT7Kp63UQbFsGfN6cyrvsV5UrbXthk1qKzAwsEa1bM94wxR
         3hg7mfX7o0Y5BpCHRzuOTepS6Q/1buV65kyVyFUerxbA4e7/6aQDslFj266uLK32uHS6
         MLKKXyJqwvQFgPt9VplqDJPOADzuPxraoIC1iBWmTbCTx0eOY/ndZpW+x37oMwNBYHDS
         jNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765533279; x=1766138079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HqEG+nZ1xiQN6AJIt2dnnJZEHC10sC0sNx6sFrPvEsY=;
        b=dRFSOkjF8EXdDZMmhRaF32fZmBC6i/uH8zZ/0p4prHjWhZpJlZo5j8PwyhU7mpetDd
         P8Vf0nzLcmPWbxFt4EnAeAKixMLbQq+dv9uhKPFcFs5oW/q2DLa7FPAEUAX4Ofp1SxVw
         5eIYlrUrTk17KI6+05FeA/Z0xda8NLYH/6+wjAox3ouqJq5rq/0iBtd/N/H5vgj9XBpu
         hK1oeGvu3zVT8OzCawgtpFJ/clf3dVETiqQtlZNeTpgTt8eoEvtfSqdxS7SBocU28pg8
         6VpbW+PVJtFsEAyECoMtErGaZuK32P0hh9KCahFJpcCbQ0YOsaYato0W+1zVjlp9fcT/
         L9sw==
X-Forwarded-Encrypted: i=1; AJvYcCXeQp5NrUvHAtxGmd4XKD1rvktIgmAl1TLAR+fJOlLTo/V4W19fafoAaOlX1JKEgzQue7XwY44T5hTEZXC9W+DV@lists.infradead.org
X-Gm-Message-State: AOJu0YyPi8WAFEcrP2jZs25fDfWAVrutQCe3t9/5qWrB+UoVUqRcP77z
	bLNQUHDGOzXWmGt1Wc9u+nY2G0ykQ4eSgPDfYvyECXO0NPTz//yCICV2G7LVTCAm0oE+RX51FID
	mzhUfGY+7HShWm1G+XdtRZa7qI7kdZ/Q=
X-Gm-Gg: AY/fxX59Ams8bf+s0H1ityOu6Adb8FRQW/hQLzD6uS7nxquf/zRdyXpUFpfS1HTs0Vr
	o+TAiXJsrwbZEZl3baIzXK/K+wJg6VMQP1tKSOU+HvHy5aWDPsZNVkIJ7bpBCQxjnOeeNu5MCXN
	CzLnwDYjxjElUkta+SxHSnOWSbtHsXylleSDRG2ll1PL1NmDBnN4UckKY8Gb7GXaXvAjkNQ9sa9
	u9qM4NTm+D1bkIKffFdUIngIjq0mYZ5als/YTrZsM4gQa1gX2SZB3AxTACu0hvtfvFkYsZQFR/+
	66HoJRq84eCoNeQslRmplOvQVoc6PmKR+BiRvMoho3H8RJ3ZlpaEJ//csfWxyzyyo7Ie28L/iux
	rA1UDTwDMR8G/08VtFQAi
X-Google-Smtp-Source: AGHT+IEa+DSQ1zpDC60+Pq9ToEAnCi93aMl+ozGf04DIAogSjg2j0+bhkGR63QOLDEz4eUMryYb2KSl+0LAa0pnns/8=
X-Received: by 2002:a05:7301:2e98:b0:2ac:2e93:29aa with SMTP id
 5a478bee46e88-2ac30106a4dmr1262862eec.28.1765533279469; Fri, 12 Dec 2025
 01:54:39 -0800 (PST)
MIME-Version: 1.0
References: <20251212-imx91_frdm-v2-0-4dd6d289e81d@nxp.com> <20251212-imx91_frdm-v2-1-4dd6d289e81d@nxp.com>
In-Reply-To: <20251212-imx91_frdm-v2-1-4dd6d289e81d@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 12 Dec 2025 11:57:12 +0200
X-Gm-Features: AQt7F2qmUYq7fmLxWwsl-gTOGPlSokMij1R92_1CGnoPcAOo-CVttUkZ8C_47Hk
Message-ID: <CAEnQRZB7BtSu2ec4wh0353MYkwgzbpQxD7qa0r6NC_kf+hRfKg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: imx Add FRDM-IMX91 board
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Justin Jiang <justin.jiang@nxp.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, qijian.guo@oss.nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_015441_026008_1B7C5824 
X-CRM114-Status: UNSURE (   6.84  )
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

On Fri, Dec 12, 2025 at 4:32=E2=80=AFAM Joseph Guo <qijian.guo@nxp.com> wro=
te:
>
> Add the board FRDM-IMX91 in the binding document.
>
> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

