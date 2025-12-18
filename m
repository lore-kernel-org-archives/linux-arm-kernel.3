Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38F5D68BEE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 08:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g+bJVIpt0gfvrKpvvpbdhzaZrLDQ51BQvCd8rNT5zDA=; b=obFhqS3gkTSf02/Gyb5vx8723c
	rUXmlYj1CXNGs2lHVWy6E6ROd1KHxqoEG2a6EXKovxidt93F3eWb4Kq4AgAn1Cv+y8H0+DKN9p99x
	DNmuvtvbL07SqpGE9KKLE0OJSsdekRWRDQlwP4ywwN2DWAF4K249+QVNDXQnmSUa/AXvVm1ie5aHv
	U4rhQJTOCzb3kp+VahE+GH/c3XSc8ViUZHq9RgCI5Q/nL+0CuDv9kLyH6OPD1ck9KUnJzSL3cAiOw
	5yq+SsVCQgwBIZCwHDv7gG9iX/6wFpCQKPeFhsJN8g128MEYLYxpP/WaBbJvqf6jec4VaaV2D++vP
	8oP+u29A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9dc-0000000856n-3pGU;
	Thu, 18 Dec 2025 08:45:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9da-0000000856S-435V
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 18 Dec 2025 08:45:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=g+bJVIpt0gfvrKpvvpbdhzaZrLDQ51BQvCd8rNT5zDA=; b=iRDABKIVkQ+W5cF8rfW5xrhGBI
	6dFtPiUselvl4YUTQ6Q0Otvf9cbWd3+Xg8vZDk0pWVLwut8MNGK7+iJefNy7g77TQoXcCPCXrL8DI
	vXnglb401H+OfZt9j4PjZXvv8dF5ZyqP2gukjcfw+lygMkOZKobElximP1pNhStIi8MXwUz9e6Jxb
	hSD/ZOm59o6UAHKhnhWs3F9C0Rj//YlvN+mSrBqa6dAGzOgDBi2MzCi4+x89XMPoXqSowPFuT6yWh
	y52Xpgi21XJIzcWXY3T9XSrhzkBrEH2esA6XPLoYP6lVqs8IdIaQSPrFB19T8dpsnCT2Ptj5nZ1T8
	dqvEHKrA==;
Received: from mail.torqly.pl ([51.38.112.117])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW8lx-00000008NqV-0B3p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 07:50:08 +0000
Received: by mail.torqly.pl (Postfix, from userid 1002)
	id 08184AA73E; Thu, 18 Dec 2025 09:41:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=torqly.pl; s=mail;
	t=1766047347; bh=g+bJVIpt0gfvrKpvvpbdhzaZrLDQ51BQvCd8rNT5zDA=;
	h=Date:From:To:Subject:From;
	b=lYGU91SRWiEGVI9nIPIuPOSrg/W5G4K8BIYPzsaDJnVHN47BcASJzKfR8i69pphcU
	 i5R5dgRa3f8+JllEa9zzySvdUqqwHNA5HFSJ0Pg9J/bzjcP5ydK+v8/W9EzTPsy9zw
	 ElxfySqh1x3u2zRE4UyinwZRGRPcKho5jo4MjfycBoSokF++vfMlsHIHIItI4S/lL2
	 KMwm8qsO5yV5w7/N2M9Qay0OAeBePTwexADsAo/yjboDen5mUFiJMXUK4QCHU67kYq
	 M42lTArnTt43LWEP4pJqIAJb9aok9Qc8jEHJQtB9DLxiX2HOOs7zA/hXAGUO3coplu
	 ZcL3fRjAEfPgw==
Received: by mail.torqly.pl for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:41:00 GMT
Message-ID: <20251218084500-0.1.tu.d9iig.0.cnjfo24rna@torqly.pl>
Date: Thu, 18 Dec 2025 08:41:00 GMT
From: "Tomasz Jaworski" <tomasz.jaworski@torqly.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: =?UTF-8?Q?Ulga_na_sk=C5=82adki_ZUS?=
X-Mailer: mail.torqly.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_075006_146392_7909D226 
X-CRM114-Status: UNSURE (   2.31  )
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

Dzie=C5=84 dobry,=20

chcia=C5=82bym wskaza=C4=87 Pa=C5=84stwu mo=C5=BCliwo=C5=9B=C4=87 zarz=C4=
=85dzania benefitami w =C5=82atwy spos=C3=B3b, poprzez nasze intuicyjne n=
arz=C4=99dzie, jakim jest karta lunchowa.=20

Nasze karty oferuj=C4=85 wygod=C4=99, oszcz=C4=99dno=C5=9Bci i zdrowe wyb=
ory =C5=BCywieniowe. Dofinansowanie posi=C5=82k=C3=B3w jest korzystne dla=
 obu stron. Karty lunch to dla pracodawcy realne oszcz=C4=99dno=C5=9Bci w=
 postaci zwolnienia z ZUS do 450 z=C5=82 miesi=C4=99cznie na pracownika.=20

Kart=C4=99 mo=C5=BCna do=C5=82adowa=C4=87 dowoln=C4=85 kwot=C4=85, a niew=
ykorzystane =C5=9Brodki nie przepadaj=C4=85, lecz przechodz=C4=85 na kole=
jny miesi=C4=85c.=20

Mog=C4=99 przedstawi=C4=87 ofert=C4=99, kt=C3=B3ra pozwoli zoptymalizowa=C4=
=87 koszty i zapewni=C4=87 pracownikom po=C5=BC=C4=85dany benefit?


Pozdrawiam
Tomasz Jaworski

