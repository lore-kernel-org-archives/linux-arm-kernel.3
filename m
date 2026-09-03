Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90D5C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bQnH6oPwh2rgmIIUJ5Tnv4TB9rJdFNh4J+fzYdpOCl8=; b=DgX5VdTiwR9TJTs0jv8x4gwzwE
	JTspCAOL3T4hIACA3poLAnuMMq04jZX5Ojy3mUCoEHoVikZmDTGkiSkNoX8UrjBbPDvEMnwiZEt7s
	1VWJOYMHFc3KxbwIrnQjTfhSJXZJRuIloYRfRXQDDWSoYvs8l+QJ8UudcCypatM9W8H/hITOD4gO1
	PXcmzgIfUxU7IYOFxtPdTAlkCMG8RrRC4ltYOZu0smSiziDJ9Mr7kszWKeF2CgJkgyKZ9Ltf/BIbu
	aU8HWqhUid30nzAqGM5O+PkricM2pNFnzX23gqiXuOGWhTl7kMuClS/Ue5zuR1ugbIrX2bQVg8bYE
	NSKeBD8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22MN-0000000GiYZ-0pvp;
	Thu, 03 Sep 2026 07:59:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22MK-0000000GiWa-2ITw
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 03 Sep 2026 07:59:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=bQnH6oPwh2rgmIIUJ5Tnv4TB9rJdFNh4J+fzYdpOCl8=; b=l02iU1NNnhW1HGH+3t+43ZydAG
	xnodPyNGE63RJVS3DiArztDnCw0ihvbMqAo0uVN70+6JZPaMC7GVCaDce6Yx+rUwogbreJgI0dan3
	+7SvTWU/ydCQxv98+uN4I9ha5JsofI8eMEll62VVTnkK7SJyy3rsBR0WH31eoezNVogEvZMBSM8Oz
	7WuCuY/5l4B04mUbmWo40m30wEYY+aS+07ScYMYOOHjLKyWtgsTaO0RoJpJfFStZvC2zYka5oQXRQ
	Ol1BNq6FULqoE9mgNqcw2OP66yE/a7KANjdwO3cRIrUMNF9pEKogljMYzG5ppN1qvv/QV9AaxOh38
	y1N0QyQA==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x22MH-0000000CpTF-1gnf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 07:59:43 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48584dc164fso1155f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 00:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788422380; x=1789027180; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQnH6oPwh2rgmIIUJ5Tnv4TB9rJdFNh4J+fzYdpOCl8=;
        b=a+iX+YB5y7XSQZPitGC8SKw8V59RDN4ZE79LPy6ji9Idt3FuOwCDKvJpwZcziqQ5Hz
         vSvhDY0NhfX9RycH0zysIpkgquyHrtmQNRV5xD4wJh0FJzwFZZt4KDKvsV/J620stSoD
         1Ltbxt20ZwckD52CuBmHKrLW/47uNqnDg3uuLEtcMCaV5P+xN+EHNVF9BH3+fkf+qKS2
         QmZkJPCJaitAn21PWidliTl4Iuj/mNj4ZWIQSXL3DtSm7iTfOlnYUuZsO5Jz5GMto4p5
         FOptv9FMGC2gbYD8Kn2argf+lk5EKWjNcJfhu7nbWk7dt24dk6ZcfGK8bER+DW3a3Ox7
         cikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422380; x=1789027180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQnH6oPwh2rgmIIUJ5Tnv4TB9rJdFNh4J+fzYdpOCl8=;
        b=Jq3OXFuT7bFqSlzRqDx0vf5tsgtTMTHf+M1tpQbvjtYdEmWHXlzoekcfWnk3kxbJXQ
         K1mZe8mmUk8wZokbSfRPIW/7KE/UTaldfJ0X4pPljMa56MTyO9UyRMY1Wk9DFgeamnPR
         RGO3YakBYnitEDGDFkEqRS1KO39RS47ZVRd50dR1FHu9mG8FGPq6SeeJkWbSCJEF7K0S
         zSmoljHLvsdjR8wGL2JMUoAIrj6ZdPoPQc+bhS2vbEtOoK8voqLNaKuSLieq4eQlQ4Rv
         6QeoOvT9+PWBzLkyAYol2r+fr6388c0qz+7nHSqfaaW+QKrJdPk6RYQU0ksNQ1/p38lY
         noxA==
X-Forwarded-Encrypted: i=1; AKwUvBxsI+IEfz1ea/h/hoIuQ9zkekgreNRTP66AoyGPn89NF0DPH3rocCjKbAX8t/a0Hwg3NJo7BFOEivw7FwSy8lp8@lists.infradead.org
X-Gm-Message-State: AFuF++kKqAiha74run2curzD9fYxmYBKd+LLx1DRckXJ+zUM+EXjvXut
	UsIAm6PmaA3pY2UQFI/IFBPWiO8zeq6vAMSB4RrPqE5nc6tGCIBj3iuI
X-Gm-Gg: AYBFou1ca68dlLXrjgTpmpKqMb6Q0gqsmBhxVA5LKz5P5LHR9ongSuPwW94tfkE6FS1
	+2blMoMW/fVNEyE9haJ4Lf0tUeR/EMr1gXwbsj9XUMryNIfamUh+VDQKKEXGIJ3v0nTF2OSGHBx
	kCqWvYqUBL79+LyHqgMf0QOiiXNceSU/U1vRvvBGyLC6/UVE2OytQTTMV4Btro9Gumzz8Av6tBv
	QlAk2U8IfKq0B2Mw3dmxzxt7ubtLoqX9u86QsM3gKvgvGpYfqINobjmJrjX4XL4vSPhddvIukbK
	32VvTXFURWEuYPrsVSbQ9hD9k5oTBkRJJdiTL5jh/BpGdcqOiat0HZXZN6227E3tc//Yw562VXV
	Yk29LwvVxBKq5a/c02MdD4ljFDrOOLyYoS+P/MlNcM13/uA/ElzoMrEPOdYC8BKu8r+jtOq4dg8
	8I4jYzHzvcFA+NMFPUxm+FxjFyiFD0C3NjnO+Y+zR322OhAbZOM8HBmbJTwWAaJC0xVA==
X-Received: by 2002:adf:e196:0:b0:484:3311:3703 with SMTP id ffacd0b85a97d-48488f222d6mr21633674f8f.26.1788422379658;
        Thu, 03 Sep 2026 00:59:39 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72c28sm12914843f8f.6.2026.09.03.00.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:59:39 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] gpiolib: add get_config() and gpiochip_generic_get_config()
Date: Thu,  3 Sep 2026 09:59:35 +0200
Message-ID: <20260903075936.2089280-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903074509.F36471F000E9@smtp.kernel.org>
References: <20260903073143.2068494-3-mehmet.fide@gmail.com> <20260903074509.F36471F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_085941_679204_DD5DF8EC 
X-CRM114-Status: UNSURE (   9.47  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> [Severity: Medium]
> Does pinctrl_gpio_get_config() actually return a packed answer?
>
> Looking at drivers/pinctrl/core.c, pinctrl_gpio_get_config() intentionally
> strips the parameter and returns only the unpacked argument:

It does not, you are right, and the documentation I wrote is wrong: the
packed parameter goes in and the bare argument comes out, exactly what
pinctrl_gpio_get_config() does, and what gpio-mmio relies on in patch 3.
The code is fine, the kernel-doc in driver.h and gpiolib.c and the
driver.rst paragraph are not. v5 fixes the three texts; no code change.

Mehmet

