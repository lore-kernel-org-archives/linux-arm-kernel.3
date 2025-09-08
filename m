Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A5FCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ida/lmq2CvCaVRtbfZQogEzqIEvpKI5nNSXM2BB/1b8=; b=MnnLUm1eDX6fOg7IAsD7fSTNHE
	jvUOqhl9krX76LlSER4uAzblshoD0LRDIhTb2rhy/F1cHtRA3ZbKP27iH2Yvv2phaBAPFm9ux7M99
	Iwpo3rihM/YaZKsFMSLS+KaK/euiePmFktqMUE+Xhwdcf2Gx0KcKS7eLyao0Oa56r4d+YyC3yn+r8
	x0O6K3RcdbG7Guc/6dPEpD+MSPm2s/EXBQVCKeUmrsTA/GsIXc+5UzgW+XW6C7b1FN7NbFtTvLJgj
	q7Ebw/BsUVlXhdWtfUIzNa1s17Ef8k4H9BTAM8JofV1PBt9JnaxfTcVmed6fyptJjmuMn+lZm+k0A
	T5YJ90Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsBb-00000004oqv-3Sl2;
	Tue, 09 Sep 2025 06:50:39 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvi5V-000000024B1-3cY9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 20:03:42 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b042eb09948so934507866b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 13:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757361820; x=1757966620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ida/lmq2CvCaVRtbfZQogEzqIEvpKI5nNSXM2BB/1b8=;
        b=CXZE8evUc/lMtmYUngFuGKwS4zoaGAqgvSkLqgqqr3QBGa4KT9Rq3xwkpz0546WDxh
         ES4ntGSVq5UNrsiWmF8m7yGh/oNeF51cJePxGH65Xg24E2rOEvbeMUrfeCLXgrv4HJFX
         RJf353I8LS1O+e3s8CLjYoEup4qwF0O0po08F20xE9Ni4bp2KqE/YNGZFPHm791UsdXm
         TGcLFWruhjs4t+FQfaXSHE/6jYLH1B75YcJZGTnxINfKXEZdjNYBEYJKSw0SVzPHF9Xx
         anq4nbb7X704xHJcJBa1C7fQC2D0k8MLRxusY6ERwRceBmKOJo65UL+Xv5v4OnyFBPRB
         9b0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757361820; x=1757966620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ida/lmq2CvCaVRtbfZQogEzqIEvpKI5nNSXM2BB/1b8=;
        b=DQGDHOjDdHIwN9YEr5hv23gz/xW8elgtQ4E68zZqS05kpdBi50KXj8t+iHWF7bYr2q
         vCYvm9TswMnNslK2XAH6GNPJQYzIUClB5xq0uh2CEXCi3tLyQNFEV/q9Qeat3x+u755p
         VVLElt50lRehxiFIkclzvrAMz0OaZXfapr3VPcY9dYn2jFeQ6kqh/MhNYUSdVlPPVZaI
         Caf746sEGHKcceOjdm1vEUCiP34twS7xNRBPvyPz0pEEH8wKOqN2zYCPeyGa/OJs5Jgq
         IVGAScXT6Ydp/lbCVr47eLYdmwAfNHjDeByAyF7TZrTsnFI0S8j+2KRmrpthAeJmyXib
         BMdg==
X-Forwarded-Encrypted: i=1; AJvYcCVN3OvH1kUkzhNqRFd8YnAfKubf2XTCk5/kKpAn95zKj6iXDxhuthbzVc79lJYdkzCTOTxZO+ghjcBtZER0djm4@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6n/DnggSI4rfSoHxCjVeHq855CYQxwO0NJo0VANYx6QKgbCBr
	avZs3mGmAv49OQDFBsgF7AR1t7QRUhXV1JaW4qlOkAofQch2buklT0zF
X-Gm-Gg: ASbGncva8s8bEg0VmP17TDzrB6GMJVxnac6Z/pnN52kyi1nTK0uE4U/d1vbWfJXBfmH
	Ntl2uG4hfejk5x0lyO48K4XPghAEaZYpbVFy3waHFwXE/HOOhwAK+9RIgrYM8GcaHt0JMEyIHfc
	WIDYuBnTGiT+X0ZhHF9BBy+uMi/EhSyG5x7XsNzIMcJNbmBgP7L3EcxxYuSVJ1s1j9CgBr9J67u
	LgLNywA1FXblvaiA5hrg7cHnOkaMZbhvUE2wifUaWpvqR/QzPHNM9Zcpa7O20UpEzs4YSHkcXEl
	aSjKaxOp5Knen735a+Tf6v8V5R3i8ujRP68m2fD1On/RjEoag84d2Mra7uVg+G8z5tryofQqhAS
	Q3IRP7jrjidE0U7HUnZGmJ7lM4VJWZzmBB1/iB4xIFO6z3ub5Mde0I38TfSfNq3HMuEj+MyhLsA
	==
X-Google-Smtp-Source: AGHT+IFqGWzlEZtQOk/UnWNlOkrNxSCMaLPJApJMoATfCsdd8Y1r8qxaW7hfuJYJTHH4C3WtzjR3aA==
X-Received: by 2002:a17:907:3d90:b0:af9:eace:8a52 with SMTP id a640c23a62f3a-b04b1712177mr802551966b.50.1757361819694;
        Mon, 08 Sep 2025 13:03:39 -0700 (PDT)
Received: from localhost (93-140-134-186.adsl.net.t-com.hr. [93.140.134.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0466a962c4sm1440182366b.71.2025.09.08.13.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 13:03:38 -0700 (PDT)
From: =?UTF-8?q?Duje=20Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
To: linux-mmc@vger.kernel.org,
	ulf.hansson@linaro.org,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karel Balej <balejk@matfyz.cz>
Cc: =?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] samsung,coreprimevelte enhancements
Date: Mon,  8 Sep 2025 22:03:20 +0200
Message-ID: <175735302650.4660.10666700905284639683.b4-ty@dujemihanovic.xyz>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250828095028.24503-1-balejk@matfyz.cz>
References: <20250828095028.24503-1-balejk@matfyz.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_130341_900559_108D86C0 
X-CRM114-Status: GOOD (  13.36  )
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

From: Duje Mihanović <duje@dujemihanovic.xyz>


On Thu, 28 Aug 2025 11:49:01 +0200, Karel Balej wrote:
> here are a few patches adding some of the stuff that have accumulated
> since the support for the samsung,coreprimevelte smartphone was first
> introduced and before it made it into the mainline tree.
> 
> The patches are based on mmc/next because it contains the new support
> for state_uhs in the sdhci-pxav3 driver.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: samsung,coreprimevelte: add PMIC
      commit: 9d5f358e797c87c304a8b0af5cd43f08218dfa2f
[2/3] arm64: dts: samsung,coreprimevelte: add touchscreen
      commit: 081ff07146ba5fc752843a389cf68a10c8047a73
[3/3] arm64: dts: samsung,coreprimevelte: add SDIO
      commit: 51d00644986b750d54e58aa3dd5eb5fb0e6040e8

Best regards,
-- 
Duje Mihanović <duje@dujemihanovic.xyz>

