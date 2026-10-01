Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5ACACA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0LImfjQfnfpJNGHfHRMcENmUv0z1qFRlVshw9HPZVsc=; b=aAcON2FVgg1mhjJ0EfU0k+SsDC
	YWwwCJMk0EKCrdBXnszTRWm0pY9eyZL8QxeGnyYJorHeqVrBSq1zvkSrqlEXan+/aocrGAGIEw9J6
	A5jrbKZtP5fqXaNldNBmj9k9biCz9AbO+EulirLB2Qx6fVFwCUIP7Pf0lbTkntGxwWeMJXY4YW1cE
	ZI0ZrhRWezaLULCBIVdWw3sLX5sAeLKPUP6EvMQgtrF2ss4Xxf5HfhkisCU/U6YVg32+rEU4mNN4V
	69x73065dRgj91wIxkOIvctzsaHk00N/rM1yUaGx/p/uVPJQmWzXt881m4cKlvoxm3RyGkijPS2v3
	vQQVzGBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCAzf-00000007yN6-2vN7;
	Thu, 01 Oct 2026 07:14:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCAze-00000007yMl-1Mio
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Oct 2026 07:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0LImfjQfnfpJNGHfHRMcENmUv0z1qFRlVshw9HPZVsc=; b=eITt3Wjrt4Uw/4yXryd/keXzoc
	U7uBH+CFq4rxTjS5T9P2uzParGhreDdbz6/gdDqLz6orrtSK/e8+LjlqD6q3ie15jFE5ObbJaKafj
	7cX4CvvvtF58ub4poxQB94Ks7a/Uocx2OB1DaroYpugpi6M9HM4b+mhhyRFEUUhwck3z355lqFVwu
	+uf23zzMIncI3xZE43iM2JPtGjI1DSWkGyFV8OLD/soUSoCCxNHyX+jNUioKNXx8qPFF2UogCFzMC
	rUzx8sUuk2rt1nvOP6zmMe45qZ6lj+tvZko4+Y5Dnk8adFarfysIrXpBRVEUoMCNAma4/GB3AeZ/F
	sDAbJuow==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCAza-00000004fQT-1voM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:14:12 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-4a022e9cbebso1357015e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 00:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790838849; x=1791443649; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0LImfjQfnfpJNGHfHRMcENmUv0z1qFRlVshw9HPZVsc=;
        b=ZtB+rOQU7JqmK9lxHexXLKpAT4C7cgUNEyzbKBBfykCz7rE6lw0P+130HzNiEgyP3F
         uKSo7upZNGlN4ttZEtUPm6gRerDm1u4byIKYjRJVgBJ5bvo0D486kuWVtciphpTirexu
         pUvs3Qxj5LW00ZQ86rtuDNY6vm2GZPx/O7Z4MOKsgMcqRs3Ew9KbzAqaBbuGvcd/oR3F
         rjLL9WoOZ4mSP/ZG51UfGmKwyHiNBRjk4TEqmxe3LHvNzPDAT/EAYLDoR6g5xLy2w4L5
         lqg45r4gvVon7a1S1rbB6yS4hHumQuOl57OwxD80kqrLVTgtqw56SdNjmc9KjcG4eLvj
         XiPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790838849; x=1791443649;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0LImfjQfnfpJNGHfHRMcENmUv0z1qFRlVshw9HPZVsc=;
        b=gWH+rZHST5Q2qBOM7+R+347MHVC5kt+kuaZXeYJvQdzw60KsA/92m3KXucMx8TGsz2
         A8FfaUOVMDGB/00UIUhYhdUczofE+q2EjTt/K3Ud6RJUBxh8au+nBZPsg6BX4f/SaFPM
         6YfPilJafE8VjcZvX5vouPcxWxa/DlXvbrJurmC7W5+qkm7nhRMeFDaZvdSDs6azBzAF
         p4hAfmGseOIM9RFI4aK0D24x2W+ddeqw6YyTdeo6/X0kTFNTD+KeDy7Uoq2547f5qTr0
         /dmPqg+7nXyMJYThsPIzkf/uNW3TqB9CY/bysQrJAp9XO6mpn9gRT5gO0djtu06l7d8Z
         UYSw==
X-Forwarded-Encrypted: i=1; AKwUvBzJS/rwI7bslgczQuGVnfvoVkD8RY3vhdRmw6AwKirkjWruQ9sThW5orqtW826VeMN8pWzeGmW+kWbfFnTbOvbr@lists.infradead.org
X-Gm-Message-State: AFuF++kU96xDfXnSwTVRtKIt1UB4wKzcpZJKoYVhPnzlLDhAcGuzkwgC
	0DnH4Y9IyCqvTcF4iTkYJJ3IaRMfLUL7UyKxhC0vGYO1fRR4ZFBVbABt
X-Gm-Gg: AYBFou09SfPR1zKSwXOsqpuIuktXjX/IENUh4LO2ln+Ti5EAM+X1atLemDfaQeyfEnt
	hxDU4zR6Dgpj/ivFTOZ1+rKlWukRFLZJDxyo4DVw6bwWZLlNMFgENovijVrKDlhjttzN71YEZbp
	d4AVWLhFfKHUfjM5sFsOlfi9u/LcGzHNWW7HTcV0hvPrlRZppXNjmuT9sG9kb55umBAIQbdpWCA
	6e2+RFNt4o90v3ZBQoYPmON2ZjAu4bIz8cjXQyuLqNzVjYuqsH9CAyxOKEYCaxLHf6owhtIDP/T
	qHjltYXE3RUqKPmq0shAbiCe57iy/BhgzpqNWk8cYBB37rmBNnHd8LhXBXhnoSBW+Xlj6MIi1PN
	YT4twwNdzsy4SzqY31vrQLOAHzxVV3Y9RBdtWMofoLOv2DY+X97SWfzphbTJtYzJpVJJkBzvjWb
	uhISLUvrtBHMKg4ci7hNhukhWhj3FXnQN+P0KkPiWdWL4ZLODhjRaG7SK6W/1izJFNsL96vu8t2
	aF9SHKi1pRafwGW9isBgQIdkyUWTbzt
X-Received: by 2002:a05:600c:4454:b0:4a0:8b1:f5c with SMTP id 5b1f17b1804b1-4a01b00f607mr62337135e9.22.1790838848782;
        Thu, 01 Oct 2026 00:14:08 -0700 (PDT)
Received: from [127.0.1.1] ([92.241.26.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a020f7f220sm45635745e9.5.2026.10.01.00.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 00:14:08 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Jason Li <jason.li@cortina-access.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Subject: RE: [PATCH RFC 07/10] tty: serial: Add Cortina Systems CS75xx UART driver
In-Reply-To: <SEZPR01MB4208C11DB288933965D7BF83A28A2@SEZPR01MB4208.apcprd01.prod.exchangelabs.com>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-7-4617c4463529@gmail.com>
 <CAD++jLkzcf7gJB82XT3-xb4jLujtWSNz1kT2r1-4N54rRfRNMA@mail.gmail.com>
 <1d81c2ef-7a5b-4306-83d2-ff96b0eb6a06@app.fastmail.com>
 <179076749140.3134070.3869742286743401078@gmail.com> <SEZPR01MB42087271C56AD1C7E926AF35A28A2@SEZPR01MB4208.apcprd01.prod.exchangelabs.com>
 <179082517588.138645.14615134489246049313@gmail.com> <SEZPR01MB4208B8B4A5A7F48F7FFE0C9FA28A2@SEZPR01MB4208.apcprd01.prod.exchangelabs.com>
 <179083239972.193541.4791387611943615705@gmail.com>
 <3ddf4b8e-14b7-442b-9d4f-5167875e3d64@app.fastmail.com>
 <179083615914.311026.2458351803214458859@gmail.com> <SEZPR01MB4208C11DB288933965D7BF83A28A2@SEZPR01MB4208.apcprd01.prod.exchangelabs.com>
Date: Thu, 01 Oct 2026 10:14:05 +0300
Message-ID: <179083884593.341205.12618374409894485981@gmail.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_081411_154309_3C525F9E 
X-CRM114-Status: GOOD (  11.58  )
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

On Thu, Oct 01, 2026 at 07:03:53AM +0000, Jason Li wrote:
> And we are no longer involved in the support of any CSxxxx-related
> products.
> I'll recommend "cortina-access,caxxxx" for all Cortina-access's
> product.

Thanks Jason, that settles it for me: CSxxxx parts use "cortina", the
CAxxxx parts of Cortina Access use "cortina-access". v2 keeps
"cortina,cs7542" and "cortina,cs7542-uart" and the dts in
arch/arm/boot/dts/cortina/, unless the DT maintainers want something
else.

Fil


