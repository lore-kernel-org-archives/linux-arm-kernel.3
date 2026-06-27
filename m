Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FEF2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 06:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lxEbe1Kcf5HJ3vZXPZHCnhc+3o+B9n10H9oF7tgbYE=; b=pgqDh03ukvoxTqNx9T6cobnj6x
	Wp7Xutbrx8ln0Zl93o917XaCT/t8lWSCj72M02BKTQwucfdHmy8pKSDiQcvVzPOonaWBtCbIkqLRy
	hW5YoUTELTo1GGeNIPQa0HJA9zWwBUFnLKmeedr+JMnISx9fhT1o1sJxn+4YPC+CmHRjlwEvjfzUi
	rjS6Bt3HwITOMx2nuRqP4iLHFXjTolxYwt2wtIedWKT164+RbKn0i5S1tNkR5B+Tm38nJFzyqSY8r
	xbxK1cH6OGZoz5gLAs06tI6Syyy6fBAWfRbAVJCy8qkBiYHVANaD4VmO3bFBGbr5JYtc6uQnuGBi8
	kfNbCFjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdMio-0000000CDMf-2iSQ;
	Sat, 27 Jun 2026 06:40:58 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdMim-0000000CDMA-0OyL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 06:40:57 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49258ac7294so11918175e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 23:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782542454; x=1783147254; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lxEbe1Kcf5HJ3vZXPZHCnhc+3o+B9n10H9oF7tgbYE=;
        b=nPEQ+A2aqNmzHDBijFpN1jkzGyoA7P5tsMZz5q+COREE/RE2CO2owxDrNwaiHYZMzT
         xTaDzkOS3K6vCQVY+2nN95S3EB5YvvghDgBP7xnHPX1bCStFDHKGyZgOk1qvhROVrqcs
         xbZyeGm/GC8fRzxT/aLVbZwTJiK1nPcavgkBD8u3cZ02CtRg7DPp41k2TC9bl+BVI2JZ
         UB6/RPizeyQU0zL9FEdNCih+efq/pWkpx1Cg0pSfJwCjrzUSzXgTcS5EYQI90Qw/+43F
         LvYpVUOvaSq2dTdhtmcwDTdO1DZxV5w2aZauumoTEYjUBXlLDFzaJMPk52io5TOv1xoF
         MA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782542454; x=1783147254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4lxEbe1Kcf5HJ3vZXPZHCnhc+3o+B9n10H9oF7tgbYE=;
        b=AcwQXn9lPBbUL6dAO3aCNwNK6QhzpM+++u7QZB9v0KUxkiOYkM+TFTEVSh3dWmC3Yo
         4h8SJidlxn0lTiWQSE9wYzgFUSHKxrCLD8XRhFMELHxh83+vtmebVSLjA48UiRrkpfWq
         YYoxs1v6bMOrV/yXBvqTYVnRhlyTyboJLvShajFBtWqLuQeoyYMPu1zRWI3oGkyNK6UW
         Vg579Q1t6UZvkgVL3+rfBb/BEoaaZbDbFTOFQMW4jJxX5+5Oay0Mcwb1js3yQpxyPiux
         otZrPUHa8+jfxXzSexfgNemFkKFIY48aNsL9sWUxtYXzvIktVfEof3uL5hhRuZmvscoA
         E9gw==
X-Forwarded-Encrypted: i=1; AFNElJ/DhZmOcJCMZuKMejfseSRxbuRP8FKgsDcBK/tHTtbSpEAAPNCFATiz7A+2MMbhNVRL98dWvGeQihQONnuoBYWm@lists.infradead.org
X-Gm-Message-State: AOJu0YyHiDAjNFZ4gl01knscw5fu3KpemObWgWclu91cyJ+yrqEifCLy
	YVN6qNPaw6Xlp3a2FyxGfUgsUXoZ+bb+yczUpUb2t4WPvRkZSkQcvCAx
X-Gm-Gg: AfdE7clQ2oq5tKQ12H+Lc/+YdzxAFdy86bCxQyE9PggetukRKMgA3FKSMPqRA8Hl33c
	+Atc95i0Jb4BliY/Nd0C5YoaGeU9exlZwwcUJRu0g9uPzxt2jN5MULYc7F9uDeKFx45mxna7/EL
	QCw/VmxSJ7nIzFkkB0nvLfSd+gKMr7LEeC82nWeC3Nit4HMTXFi+sen7ix4iylumDUXO9ZH9+v/
	FVHjV/gypp/fkTfULaJLBwmnqzSvzihM1X+JX50z6gCsnaU9s3SubDty+7EsRnti0/h1Nvi1sFX
	D1W3bKQ/RS+yzpvtGThuLIgNMQIhImV1gElN6PZLNTIoi4vVK+Zzn5sTqu/1VNv9G9svet7y8I4
	eix3pJRbDwFVOWzjs+2PXwW/DKSuUdbIDg7nDvSbHJkQKFnwHdgzHyuGw62iNucm1AwD7OUk4N4
	N4w5ljR1m3uWTceqth/HdIytev0sZJPto0T4BWDe5dRgDO5xgnmLDOcZPQQ7R3CoDZxvreG81Et
	Zg9
X-Received: by 2002:a05:600d:6454:10b0:490:e243:4806 with SMTP id 5b1f17b1804b1-49266866378mr115051425e9.9.1782542453864;
        Fri, 26 Jun 2026 23:40:53 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49269002511sm131006755e9.8.2026.06.26.23.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 23:40:53 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: pengpeng@iscas.ac.cn, Samuel Holland <samuel@sholland.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: sunxi-rsb: fail hardware init on soft-reset timeout
Date: Sat, 27 Jun 2026 08:40:52 +0200
Message-ID: <xeoeYUbJQDS7SBkqsEa63Q@gmail.com>
In-Reply-To: <20260625003416.15841-1-pengpeng@iscas.ac.cn>
References: <20260625003416.15841-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_234056_147899_CE03203E 
X-CRM114-Status: UNSURE (   8.59  )
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

Dne =C4=8Detrtek, 25. junij 2026 ob 02:34:16 Srednjeevropski poletni =C4=8D=
as je Pengpeng Hou napisal(a):
> sunxi_rsb_hw_init() issues a controller soft reset and waits for the reset
> bit to clear, but it ignores readl_poll_timeout()'s return value.
>=20
> If the controller never leaves reset, probe can continue to publish child
> devices and system resume can report success without a usable RSB
> controller.
>=20
> Return the timeout error, assert reset again, and disable the clock before
> leaving the hardware-init path.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



