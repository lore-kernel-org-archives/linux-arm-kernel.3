Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64313C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 19:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51c7EGTXWgCerge/+6g5NVFzyP7AuWBklS9kpsuyY74=; b=eTYHzTk7kDFg13qVFmA/QTHhXQ
	vHEaQs0sejZEzyr3xA2bwFQXmrinwYw7+iozEFDlfWhOpxb/apVDPWuvb8zEZpIlymC2Avahr7xK0
	/VUxXMbKemmIriEkkQyZesEdSDCqU0KHbxlka98IGavAwnQROFmO20PAjH+Y/dioI3b7V+fcoYypx
	ckZxJBYjNm5+Hot5zrpa+pos4WpZUIEqOP97jCMdiL84texOU3w7GucH+GlVdjeag+4Cc4EmKfqGi
	NoIuGcvE3Esejy2SRH3+W8o73hvT6q78mFoWJ8ipUV1FW0Vf8PVY9zvTdkhMp3MrgP2u3W42lkqon
	GrTdqRjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wubFG-00000001SaX-3r5x;
	Thu, 13 Aug 2026 19:37:42 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wubFE-00000001SaC-288u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 19:37:42 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47f904e80eeso193423f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 12:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786649858; x=1787254658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=51c7EGTXWgCerge/+6g5NVFzyP7AuWBklS9kpsuyY74=;
        b=EmZLOk8714FZT/rqxuCL/s8c4objn7NCPA7f3ng2rfnsOaNbm+rjtVm6AIfDOlctfx
         62xxnZFIv6EkNnA3Fwmyv2Fx2O3jDG4DTyDmIEFaNKl7QVqChWo2GMgVux4vO446BkAb
         aBtIOAGT4kNRboZ2XuwxPIUXeGBzee9Vc1iaJrpWNKLQZe7Jae/2GkOCsjN7/cXXPVGO
         4mInh2cZuOcEvJKPlp/MPUfohN0B0nLJ+STleXORRiV+gFo+9ed9TgVVty/ZZZMxFrqG
         PHo2XZs1EwcqFvep2sSbguLiprHxPzWahYPLZaUsKfeOz1uidaAhwYnC3BqaqbyEij5e
         BS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786649858; x=1787254658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=51c7EGTXWgCerge/+6g5NVFzyP7AuWBklS9kpsuyY74=;
        b=JBikTD7gT8dP4Lmmv0qRTViHAxW5WI9KacicoLlTKpgQkCXIVZzwJx8FyBdfs9C6Bt
         FCBUFp+Wtk+QNCzhDNcVS510LG40xWNx5HTzHqDgQ7mJe18iZcydZRu5FYs6342E9PW+
         kPRmt1MvQusdhHviu465g4U6RGX/rkZIr/FGfomPg4PsUOwLV7yZXkU6g0xtDycjfHeW
         NvEcgu0zUZyiMlBNVZ6fpDeK3MTcOCqfVtV7+AUmZfpUS2IqYCPEROewqmuf/FqLD8Mv
         8+llMtKGD3N7VAlKFvL5J/HT7S2138ZBI48YEBrHcedWWcNw0xlQRT9MXsFj2aBx3ieW
         80yw==
X-Forwarded-Encrypted: i=1; AHgh+Rq1LDTqsbBuhUndiRuzDv/MdRYCBIhSzdfI25VfAOmYZ2o+mltLezffaWs9rXGtYDNgpjEu+48Cl3LyCMNRqJgW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+ndI5ngjvBsnpfnZZMl9mrtt/C9ZEZdpC4rjS2vsAk2zBgct2
	gX0H4Tgi2VSi81ZyMz5dN8kIcSdzejnTK7J94idqnk5Z157xMwa6XCeC
X-Gm-Gg: AR+sD10xh/S3eK6qF5YVXh2FnC37WrD4N+CsEIHFIZ6t9c+SveERqBn4n2eMWx+410P
	gqcNZU1srr67Uk/3OzXgjJIIWXyhZSPW9Qs0pNrhdo65Gz4czaYXW6CQNR6JtRnmiHDYKdl2bCn
	sPcCLb6ximFkWAs95KJIAJjSb5nT5V6UAIdBTvgd9r+t/b6WaZT7pfeRXf9JlsVKYXnx1tQSBOS
	tZN6ki5P+vtm5fHLN/RR4Iks5fHC2VlDIyTt+Y9iRcJoQqd4DqvEMUtgB1mgkLNStkhUuMZDxF9
	TF8H6ER0QsuKbfL0smGQHTBWqXVE3zZrL0TAaG8OuLwQE3cRNDaV2Jr6OMRXSErSbLEXA+Ut4QB
	/EixPCkiqpNxnepWsREoNZ9ODjvDYZzcEotgh+z8a+t5JJl4FOUwKEXsJ4h75d3VqweIyIdqhsT
	Wd4e/adW12UbCVvXv3K9vP1ovkKj15CacCbY+vrdhopiI9GYWubOSp/F5/X0nRPeEE+Q==
X-Received: by 2002:a05:6000:4a05:b0:45e:f8d0:d22c with SMTP id ffacd0b85a97d-48160761e84mr778789f8f.25.1786649858491;
        Thu, 13 Aug 2026 12:37:38 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2b1a91sm1727273f8f.21.2026.08.13.12.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 12:37:37 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH v4 0/4] ARM: dts: vf: Iris carrier board for the Colibri VF50 and VF61
Date: Thu, 13 Aug 2026 21:37:37 +0200
Message-ID: <20260813193737.2346630-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAOMZO5BwLCRd_cTV82J0KgPfSF6_kUKiSUbG-SKxNxiNu0VKOg@mail.gmail.com>
References: <CAOMZO5BwLCRd_cTV82J0KgPfSF6_kUKiSUbG-SKxNxiNu0VKOg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_123740_850369_5B0246CB 
X-CRM114-Status: UNSURE (   9.21  )
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

A correction on the gpiolib warning I mentioned: it is not a gpio-vf610
matter after all, so no driver patch from me.

Half of it is already fixed: d761c7e38a00 ("gpiolib: Check
gc->get_direction() before calling gpiod_get_direction()") in the GPIO
tree covers the debugfs dump path. The remaining backtrace comes
through the i2c generic GPIO bus recovery, which calls
gpiod_get_direction() on any controller without .get_direction(), and
for that I have sent a gpiolib patch:

  https://lore.kernel.org/all/20260813193715.2346477-1-mehmet.fide@gmail.com/

With both in place, 7.2-rc7 plus this series boots the Colibri VF50 on
the Iris with a clean log.

Thanks,
Mehmet

