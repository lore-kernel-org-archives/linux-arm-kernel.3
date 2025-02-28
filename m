Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63FCC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 19:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ER+r8NXmdkWggNU0HA9uV61RbAhrlmzZHANxsH2Jtn8=; b=3v8B5n0it63CHpWw88VMSHJYyG
	kgy4+YdNTD1+PdQ2ilz8f7Ni0O6btosMuIQqkpfc/3k2crF2vnlstVVbxhW23eosGbKE2isJSmfLB
	8mZyex0z+c+Hryj8zOufql/eDgVAUElI10XDuwTvDZMPTpZol7wSH8ghZRy4Gf0x1T1i8c69eIP4X
	sCevOlX6qQ5epxSI5Y1TbFNWedqefxtRej/l0YLfLgPL0YylvzgBjem+zlzSAJwM4fgN1goKilrlx
	4uBC/yCyqFdxz4UGG5HevArGUPhJ4X23ZGvCJmA76V9P1VESzpyaJole9fOyVxThV2kbriBGHhTa3
	epwnO1uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to6Pt-0000000CQq9-32CW;
	Fri, 28 Feb 2025 19:53:01 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6Fq-0000000COb0-3Hef
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 19:42:39 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-30930b0b420so21358201fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 11:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740771756; x=1741376556; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ER+r8NXmdkWggNU0HA9uV61RbAhrlmzZHANxsH2Jtn8=;
        b=ftcVbKvaHGDoKxW3sqJa5wxO2E+WmAejbDGUXGgxavZhqQzBYeTXIv0R8sGndHvBSv
         L2OgP5rxpQSwqVjb/ZT370l6ucGU3LjaQ/LPksK7TQrUZ75qTbvtSTQUcpOrJMramU0v
         SPTgefs5s0WtG+QKy0UatQSgN6aalYJ+5NUV2CLahfMEqiSzZS7Ezy95E3S/QxYRO4sA
         r+oYaqFWqn/6uHh2395+7xUFJX+5pjBqv2AcSwZDLeJe+xFiNL7/g843X/9l2Bh1SeCE
         QPCElJHUD3OtpCZvd/mXLQKWPv0syYoRB5vaFOof7LMPmKLvmjwLRvYJ4VRAca0Xxc1q
         XW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740771756; x=1741376556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ER+r8NXmdkWggNU0HA9uV61RbAhrlmzZHANxsH2Jtn8=;
        b=Us+Tozo2X7dzJj9eZw9dJBZbwwGaNReO9tWwNZUJBLsqm2bX5og+29QiylB+sHZGYd
         3XOjxBbEBVuf27VmTEeHNWS0nyO97BOzCmSh/OPsuDIlxuCJ6GmIAPidWR87kq2Wxxwa
         Sgf6qqpfQ9x2z9g3UEJ3W8gpWbNB/VSHoUD7gg7y6yQCsa4fSKy8lpdi75cw/PTxjxTP
         //7nKeSqzcp1ZEh49Czl3Qq7M32Xy4OaDrNOKDvbsYrJFU56e3YqnjUGYI0zZFwMV+a7
         faPp2Wdp21c+EOj4lhps4IZN+42Kv1QhAMi+w4EskuUy2yHem1/QoAHDOGTN7RkT3U+y
         MQYg==
X-Forwarded-Encrypted: i=1; AJvYcCXyk6ndcDptvgJNIrxIAb7NWI0PfnoyQmcWTAVQMybqwEtA4pDXKVZ/RbXVFPk4ma3CCcojhr7j/XbbmA1ACzXj@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/d9jaVBB/CupE0WrBazzzSQGYIbJLEf0vlXG9ACJzUIMbfNTP
	tWNNjqVig/7smRqbWX/Uf2MfgnQAu5LayGt2D/Gw+B/qfWU/MZT80XpN8s53VM5K+LHJ3x0lNhN
	xRAt1mcfY51uD+c3qBt4zbn1TOrk=
X-Gm-Gg: ASbGnct8QTHigpaz3tT+RdcKAvw1EC9hecHV/R3b37FPhUhAuEvT5GhpLsS3rESaNy6
	Rfoc2nv6lvppUEczixYUXTpeRsUiKHZPRUtivu2abPDCGTSbUec0myzeyFSdSPPczgLaq582lNU
	pDyYiXWVhB/jxwpD+CQenx6FiH3hP2E2Z18chBAw==
X-Google-Smtp-Source: AGHT+IF0kZIiHzdFJYX2bvCwbKhMQkcQPj5hmb4BkhewRGIZt77ta8Te2nCI3MxmD7G1uvJYlftQUPlvNFyy6H3yMRA=
X-Received: by 2002:a2e:8215:0:b0:308:f860:7c1 with SMTP id
 38308e7fff4ca-30b93418c69mr12907051fa.30.1740771756188; Fri, 28 Feb 2025
 11:42:36 -0800 (PST)
MIME-Version: 1.0
References: <20250227170556.589668-1-ernest.vanhoecke@toradex.com> <20250227170556.589668-2-ernest.vanhoecke@toradex.com>
In-Reply-To: <20250227170556.589668-2-ernest.vanhoecke@toradex.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 28 Feb 2025 16:42:24 -0300
X-Gm-Features: AQ5f1JoDhtvIJKnD6zt795G88ZFNlnPp4nsAKKBjoBY0YUhUy9idNheY0yKrIcI
Message-ID: <CAOMZO5ARY0P3nNnh6tmLi1p5N0uXb8ZLqkBs3ZekXD4U_-rOww@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: apalis/colibri-imx6: Enable STMPE811 TS
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_114238_839842_53222B2E 
X-CRM114-Status: UNSURE (   9.24  )
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

On Thu, Feb 27, 2025 at 2:06=E2=80=AFPM Ernest Van Hoecke
<ernestvanhoecke@gmail.com> wrote:
>
> Enable the STMPE811 touchscreen in the SOM dtsi files. The STMPE811 is
> part of the SOM. It's self contained within it, therefore, disabling it
> is not the correct default behavior.
>
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Please run /scripts/checkpatch.pl and fix the following warning:

From:/Signed-off-by: email address mismatch: 'From: Ernest Van Hoecke
<ernestvanhoecke@gmail.com>' !=3D 'Signed-off-by: Ernest Van Hoecke
<ernest.vanhoecke@toradex.com>'

