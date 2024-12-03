Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F91E6C60E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 07:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EVBM5qoQmU3xuxiwaVTztbikwXOSdVscc5nB635UeFk=; b=fqURQm/cg/VQXGWRdy/iJPAani
	mOtrAk6yCDvegczVp5ri6hetttF3ka/LkQQLk0imupawevleHRZNbuGFzpLnAUAl1NHCCaaAKywHv
	F/0yirdkkI0P4Sg1nwlwgp5JJJXjY8JEYuquoAFJRWqhzNmDXiL8Ys7I6ogmwvIOMic8QDYsetlZa
	d3lwdsBW9cV7iA6XDJPAcL8DMd4doUPGF6bUcAmAoTCbLn7STVmLtAiR6GKZ4slJ3oblRM8CyIR4D
	KlB3cjAjCw3rY1zdqvS4miwclCVMrgByWvw49y2hXN/fHF3RzThLPRuo7NIj/1/Bjj+xHtfzeW/aS
	s+9jy63Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIN6V-00000008U56-33v8;
	Tue, 03 Dec 2024 07:13:51 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIN5W-00000008Tyi-0R4v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 07:12:51 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-432d86a3085so42981065e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 23:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733209968; x=1733814768; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EVBM5qoQmU3xuxiwaVTztbikwXOSdVscc5nB635UeFk=;
        b=sAfQbDat7jD0Dnt/FhrlueE8FnjBEt31SbJF4MGuP+4EuZsncUe8cOLf3ZFAwegE4F
         TKWRZAMLPLoKEvVn6bW6PHU4vGqqYTcylCohCKunzd9j3NLtCyIxp4932kvQML/iBN9V
         BarQ/ootfY0CwhMY9EmwW2+/2f4g+ycHg67kswDP9SaFUAt2kYyAgyqzdeX5Kx4Y0hwC
         z8fL5oVQF/E1QK//rzUXAjkZSifeqs0ccOdKR1stf8slCfbMgiQmlKf4EGh/6wB/abMq
         VkyD4FCEQjumd26OzqHvjfzB225zBY8uj3kHAiS7qF8AgNwMet+zsPj1+1JOJl9QWNEB
         798A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733209968; x=1733814768;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EVBM5qoQmU3xuxiwaVTztbikwXOSdVscc5nB635UeFk=;
        b=HX60a6cJC/VOblrNS8t2MuCxdJiJ1EHNu8wmEKcLrxyMkuTZI3Y2OAFU+0BN33EVsV
         0lKZ1C1i5IwC5RirRglU5EXIr0pl5J7L6dQu8lA9nnVHses5KkAmWjXNxoSzoxLe7f91
         fs6TiVUHOmubHG7DOugpF6X1rQ1fVENoCnv8ta+vvOTh7uEuFICVYNMR8IQbYDsOdjt1
         9y6H1URU26cm4GOQ/z0834vbnG6u6TdiefyuqqcT4QEPctbWy6ucKSq1KqQioq6q+fqL
         jKIjTgvA8Sw8R40Ib+Mocl4eiBAVci/iIBUx62vuFs+vjXDnrQNm0GTJeDWCs+9nuFaV
         AXQA==
X-Forwarded-Encrypted: i=1; AJvYcCVkNPvNBF/Civ6Cy8mlWBzJLDnA/2ackkGzmJ3Yo8A6fv/aZVpVX6M4a0Qcakbxa06qstB0AS2zlprdLLBQqNFB@lists.infradead.org
X-Gm-Message-State: AOJu0YwPKNIsruBNTqNZGOIX+Jk+1ZzzZjj8GHgWOxpnND6NmSKTd9xa
	HoI2tflHtbcYRYIqhjKLSXbn0TCNBTx97qroebvlxqRA+Z9g6OAH5jqplkz2OZA=
X-Gm-Gg: ASbGncs98fjBS85B4JwWo4Uo/9lfIr+laKMPN1YUaTYgJleut4RLCkeySkE25KvXo8e
	h5toI0eHu2e+NT7M2jzGuozZQTV6E/KeHNlA62mDT5RCjP5lMCGqgfyaydiqZ4TD32pxaexDDfn
	MOh/FfaGmiUXFggfdt9E0xynpSsRKTosjgXXmkAnILjdQXcoTaPI2XzOZWkBH03al2m4Jn5pukK
	wfJMGH2GZdJNw7vNtK1FxDkVVR09nf6knEmDU9a2BU1XO5RhAUV+Xw=
X-Google-Smtp-Source: AGHT+IEplB7jYEBVeBsm9qKzYjb6Q/52WlhBD/Tf3x0VCfolLamrC+TuTTucz1KuLRGPu4rrqQllDQ==
X-Received: by 2002:a05:6000:1fa7:b0:382:51ae:7569 with SMTP id ffacd0b85a97d-385fd3e8f28mr1191117f8f.18.1733209968624;
        Mon, 02 Dec 2024 23:12:48 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e2c84d52sm9859752f8f.49.2024.12.02.23.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 23:12:48 -0800 (PST)
Message-ID: <e23721ebd766f410103ddfb8705f3d7d6e5ae3e9.camel@linaro.org>
Subject: Re: [PATCH 2/4] dt-bindings: power: supply: add max77759-fg flavor
 and don't require nvme address
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: t.antoine@uclouvain.be, Sebastian Reichel <sre@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Date: Tue, 03 Dec 2024 07:12:47 +0000
In-Reply-To: <20241202-b4-gs101_max77759_fg-v1-2-98d2fa7bfe30@uclouvain.be>
References: <20241202-b4-gs101_max77759_fg-v1-0-98d2fa7bfe30@uclouvain.be>
	 <20241202-b4-gs101_max77759_fg-v1-2-98d2fa7bfe30@uclouvain.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_231250_165589_04889C4A 
X-CRM114-Status: UNSURE (   7.66  )
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

On Mon, 2024-12-02 at 14:07 +0100, Thomas Antoine via B4 Relay wrote:
> From: Thomas Antoine <t.antoine@uclouvain.be>
>=20
> As the Maxim max77759 fuel gauge has no non-volatile memory slave address=
,
> make it non-obligatory. Except for this, the max77759 seems to behave the
> same as the max1720x.

What about the battery characterization tables? Aren't they needed for
correct reporting?

Cheers,
Andre'


