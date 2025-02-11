Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F254C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 12:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7d1Icmn2h5Xxh5nmwHTuvBMLWdYe0yLTSL1YV7Y8f1c=; b=eKtYYCyoI37DFy6cYqDx0gSvRg
	DD2Qhqi5qObXRxtOmM9I0epmk3eVaiesCdFaqjifnqcNP3D78SWYSlajCpLmy27iMaj0SknsnDPcb
	0u4K0W0ZfnM6ZGdJyq6iQ8oDuTISoMclhFNhdyDaGLkda/uwFkwwU7LqBHXREx61QMmh3//pcKtFJ
	7z3XjbsZmoitWGsE1pqgPAlgYvF6Gf5dOVMg5Ew6vUEoujDx/CZk8bmk/L0ISPj17dKXQqzdAyiGb
	vtzvpu9FTqzKuk9TtlD6sjzHEohIeqiAOzitsvEQT3okbMeu14mtLvFtHl3UBACVkwhb8soUu0LI8
	nicj3eCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thpjM-00000003q75-0CFU;
	Tue, 11 Feb 2025 12:51:12 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thoxw-00000003gEr-3CYf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 12:02:13 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43934d6b155so17580075e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 04:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739275331; x=1739880131; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7d1Icmn2h5Xxh5nmwHTuvBMLWdYe0yLTSL1YV7Y8f1c=;
        b=RL33ysKNskiOwb7tdQ09Cni8wwj4SW4dUfaEm0IOeDE/07s0o88RXAcouJWWopj758
         PaVtstYblwy8dyVkrZj7iHL7CZ1XVxJ7A5+tnsBCsERfc7eqal6ZYfzDD1dJa3sK7FJM
         UnHqGZjvtXuKv1rALquYgy5AToSLbOsnxeDv/7tdPPTGeT/jNN9Wp7w4vAleyN2c+dof
         iiiT1v0gUzIvmUsOLcp+tY1hsoed+1epnSChBC9lIO34et4NxbVQu5/L8rC8iOB677O6
         N3zlgDk2L2wBh+o0Fskq8s9bxsM93sgZ2ytj9eBYBG2Gm/dw+pbiIi2Ggx9ebBd/9M3O
         UH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275331; x=1739880131;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7d1Icmn2h5Xxh5nmwHTuvBMLWdYe0yLTSL1YV7Y8f1c=;
        b=AS1yYBdrb6+EdnBveo5e07vAZktdWQfxVX1dBVEqXqxH545Btj5iQvS+jemFAS7Zix
         T6/Qdy5MsaY70d8ryOTSFS+yWJ5OBmqIteTZdMnwioOGOydIoKyweTYqHqYYkaqUMDsE
         IdfGZ4Z8ON5xeh71YuZ8uuWQ9R+/TsohEmEpFCATV35xL8059zzIeJfAMd6H/qYtW0hU
         5grHbFTK/kr3ZTywbAdgJpLv4hhpFN6OH66Y6gMKaQxUEaCtwLFqhVWKDp7w3N8XzELs
         yPgeryKje6YipblYXCCs6NmmxlcBGe9nx1mRcx1BZfa85pHaQBnQ3jHIFjqpteGmZ6m8
         tkaw==
X-Forwarded-Encrypted: i=1; AJvYcCVcdY7QSGftgUskkTFk6ouxnRwSG9CDxiL7X+RcCf07mvzuH8v99H4QjelDlt1MiFlqyhYK88drFCYwy3nyx/SA@lists.infradead.org
X-Gm-Message-State: AOJu0YyW9cDco1LOaHfBnuDicl8RYc9L7cVRFecMb9Ki7SQUBo806Gxl
	etV37DsFklHRxJ+hZjzqvdfj70D5yDewzW7E0neSLMgNOmu7YS4Ji1hbnlwc7zk=
X-Gm-Gg: ASbGncvxfxpUyDx1bxmzjJOGXHXWWQELzu19jFXG3IruZVHnp5MrTJGoSEWZIqlB7v6
	f67cTEEh5mpl6oG/jwmUxCC1n9yLAbwMBVPu3RVXg2sikZySPpBmlYxBXf0Jm+UX8qrNqVgPJG9
	Wd0NvjUPTdEIniDH2ltCGsneqcmzYw87lp7GdOaUubpR4AbJda81aYcf9i79d8idt7p49Zj6mM4
	Z/lu4dm3j1KvrBmck3hXxlL+PtJ6+DkaIMQ0yDK4vvlHu7FzPkWuBUdD7IldeDbl4+FPK68YBRL
	sjVV1pzS4T8teg4VByA=
X-Google-Smtp-Source: AGHT+IEpNALrmIL66un9ZFpaSjUj/Foh/XSYreR+C2qRnL/fyZnSvShvXFiOPXFezhCRGB+4CDDdQA==
X-Received: by 2002:a7b:c7d8:0:b0:437:c453:ff19 with SMTP id 5b1f17b1804b1-4394cf0825fmr25778995e9.14.1739275330727;
        Tue, 11 Feb 2025 04:02:10 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcf35b15bsm11149599f8f.64.2025.02.11.04.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:02:10 -0800 (PST)
Message-ID: <a740a0211c82aaaa55940e2f07e1d1b53c23ddd8.camel@linaro.org>
Subject: Re: [PATCH v8 1/3] dt-bindings: firmware: add google,gs101-acpm-ipc
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Diederik de Haas
 <didi.debian@cknow.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Jassi
 Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-team@android.com, willmcvicker@google.com, peter.griffin@linaro.org,
  daniel.lezcano@linaro.org, vincent.guittot@linaro.org,
 ulf.hansson@linaro.org,  arnd@arndb.de, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Date: Tue, 11 Feb 2025 12:02:08 +0000
In-Reply-To: <bad87f30-0483-48c1-b263-02cc752c77e6@linaro.org>
References: <20250211-gs101-acpm-v8-0-01d01f522da6@linaro.org>
	 <20250211-gs101-acpm-v8-1-01d01f522da6@linaro.org>
	 <D7PJTD3PSP78.27N2S94J2CNZG@cknow.org>
	 <bad87f30-0483-48c1-b263-02cc752c77e6@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_040212_803757_3C431FCD 
X-CRM114-Status: UNSURE (   6.54  )
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

Hi Tudor,

On Tue, 2025-02-11 at 11:57 +0000, Tudor Ambarus wrote:
> And then I shall s/MODULE_LICENSE("GPL");/MODULE_LICENSE("GPL v2");/
> everywhere as "GPL" indicates [GNU Public License v2 or later].

No, please don't, see Documentation/process/license-rules.rst.

Cheers,
Andre'


