Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A95BC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 07:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lc6iefw8pUoUSjRoTB5D4vYyXImo4vsIqT1vRaRB9XI=; b=mFnn8MM35AugB+jkP6+xPYWQqe
	PbHASH8N3Y2IK5kMwPBoQQQzI9a4j0gClpiUqjELG5Tgwng6P8GWEIVPIMCIJ9YuD+4CBsK6vBWQq
	jVeuf7wW/+EXB01zM8lBPOfPTW9pevRzzVYUPWMo0gvuN4grXEIJSdA03DwaqSzjZmTTvlveTgUwu
	eEyJeszSqFGOkJ69LTWCnkQKsuXD5SVEjbeBVPaIBj1IDKlkpLdPgKupzFWEO8TJ/7cexzDslvgGq
	NqV4JgVj6HfiIyA23qevBvWN9xuzWYsiHBXNm20BVzfDLv1+gaYTJsiL8b8P7M+R29TF/RzIJAprY
	+Mdqz1Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW8aj-00000001P47-1CSi;
	Mon, 30 Jun 2025 07:06:13 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW8Rc-00000001O9d-1Pr1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 06:56:49 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-60c733792e9so754778a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Jun 2025 23:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751266607; x=1751871407; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lc6iefw8pUoUSjRoTB5D4vYyXImo4vsIqT1vRaRB9XI=;
        b=IzYzxC4bUu96xhhy9RVzrsa7LMJR73C+bie8O87R2dq1LDMxN1F/ap1naEy8+sJfcv
         YbpiE8cgLaB6eWkc5JUa26/mnCc3xAR8gAncJMoSOU6jUh88PzPmay5LTqnYut7QBpRR
         rNwP6JKECpSQKKYMyz2e5Bgw6gDxe7zcNW8kTt0LvSHpkZdMPEhE8z0GDL6Z7f3rXWV7
         dkhlEybtg3crJa9JRyFdtG7F0LvFnBvsCO4LoU3J9cM8J2fCZXtMPeg4nDw9LIrcZxnO
         Yy4KHRi6J0HynkyzpLq5jSMKcJlDVpaj9uWhgnir3QrAy9P35Gv274Gngj0O4252Ok/c
         IBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751266607; x=1751871407;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lc6iefw8pUoUSjRoTB5D4vYyXImo4vsIqT1vRaRB9XI=;
        b=ukOxcqge3MIwouxp50BxEi9rSfM5s8dUsoG1pp09/DGQgao0CkMnNainKNATVL59cQ
         b/QSYTTrhd5GIRw8tAo6iBuSESPgiiXoK+blW2A9znoNPY86wz8njN/hz26gCJqLwOuF
         8nKoU0b07do49525BKN5sbb3oMWTeXAlNoCcVKr3wYWg7Jvm+qZIUfbwklCB1JMi81UA
         KkoMU0TPhLTYL/2yeUZ5IwqKrOGL1YjWButF9ybCQXUsYsg6jVXr5ThgCjrL0EIWACWp
         Gy2kwRPSfbG/FAFeS57B66+J38bRD2rWY+4+El61pSv1I6A5+Axe1giGyp/qSmZKdkgm
         PZfw==
X-Forwarded-Encrypted: i=1; AJvYcCXObrtGkaonhEX+LiofxYs6CGoVbbNFZKzrodDroNKQo2NX67IRPDcpTmFUm1kV7JIg03XdTjuzoK2gjS0+20xI@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8mz4mp6grQmzXbjjRJbzrguT+PbAM45jqOgtDDGPihj5BHgGe
	zZf/RaD0TYOPTJ8/jYinVOlP0Hcnu27TfOEx6kH1Ja904V8EOkFWkkU7p3ppPDmpWlI=
X-Gm-Gg: ASbGnct8wzZOJfiHt3omN3cPVg8zlYui3opMoET6HhLmpX3elL+Gx1TNsselmJ3uVG3
	WkPFqr0hLa5In0K+Y7jeFWqxQ+XNYcJ4JNf+iUSfiiz8EudmxfTrXAWcA47sK+BDdUGDrEmioso
	oXAd6ukoyvAvyyVVdN+pP15z+I7NDB4uotY4XPoT2H1xv2ifSMNVEqNLzClHaLSSaQYTLymrRkK
	vqoiOOtgBwdxBfrBFURHkA3Ett3sPXa3z5NloUOB/l+iknwPTA7SBDYbOF4SBSItvEpaXhsGmjO
	H8IL3ru8mcdbDi0gj5zCFIoJT7YpQ5ND4wDF1Gc+XwQnuXwJau9GK83mR6eS0/PrMl2qffSGwpd
	C
X-Google-Smtp-Source: AGHT+IFRCVhe/kspNVlut14SQley3OnRV5rGZELGrH7CUMn0nRN1b59EAqYyXIds6psRg7O45zezyg==
X-Received: by 2002:a05:6402:2743:b0:607:6f27:507a with SMTP id 4fb4d7f45d1cf-60ca3e23d93mr2392792a12.11.1751266606742;
        Sun, 29 Jun 2025 23:56:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828bb118sm5368960a12.2.2025.06.29.23.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 23:56:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20250627-gs101-reboot3-v1-3-c3ae49657b1f@linaro.org>
References: <20250627-gs101-reboot3-v1-0-c3ae49657b1f@linaro.org>
 <20250627-gs101-reboot3-v1-3-c3ae49657b1f@linaro.org>
Subject: Re: (subset) [PATCH 3/3] arm64: dts: exynos: gs101: switch to
 gs101 specific reboot
Message-Id: <175126660525.23797.4623645601712442349.b4-ty@linaro.org>
Date: Mon, 30 Jun 2025 08:56:45 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_235648_373759_8374F993 
X-CRM114-Status: UNSURE (   8.76  )
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


On Fri, 27 Jun 2025 14:29:32 +0100, André Draszik wrote:
> gs101 (Google Pixel 6 and Pixel 6 Pro) supports cold- and warm-reboot.
> Cold-reset is useful because it is more secure, e.g. wiping all RAM
> contents, while the warm-reboot allows RAM contents to be retained
> across the reboot, e.g. to collect potential crash information.
> 
> Add the required DT changes to switch to the gs101-specific reboot
> method, which knows how to issue either reset as requested by the OS.
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: exynos: gs101: switch to gs101 specific reboot
      https://git.kernel.org/krzk/linux/c/98be2d60fdb70b53e29a04c807ee62e06fb9c08f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


