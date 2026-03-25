Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B380FC72DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 00:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9QUfBbiO+kjiELTZ3KNnXYoTbhjP6AEc0bBAmqsZ2E=; b=orUva+rz80jpVC5WHQhPAnaB4x
	unWsOOe9q6jeA/Nh1zvhNeuOrR8h/jk0Ot78lif93FlY4dWPzSaNY8jlf3s4r4JtUm7qi/iJalqBc
	Z8nVufNPkABYtoXxMsC6l0nNKPGh2f/D5GIeUg/tp2DtKPgTzGh6d+PZzEgA1Z5kcDVFKlII0VL/j
	XNyR56fy7fDz45neuoOdrBKiQIRdeu3dV4PcdPw+iXERAGf0yU2SbbvEe45tdnAe2Op7juyiGtHpx
	1ZkzckgX+IXBzEzGX6HdbkHKzKv3uuyQpWLWhCn20QwmfvZTLzKPbIIsPpOgNMhUirZe3/ebTvaA5
	he3AhLwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5C2n-00000002OYR-3Mg3;
	Wed, 25 Mar 2026 00:24:21 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5C2l-00000002OXx-2QHB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 00:24:20 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-8cb4136d865so581490085a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 17:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774398258; x=1775003058; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9QUfBbiO+kjiELTZ3KNnXYoTbhjP6AEc0bBAmqsZ2E=;
        b=RdQRDYqzHkwea8Ludd0IWHPBH+VCJ+//JMiCHO0q7ng1j92gBezHXbQdhOlWppWiIf
         8QAdNoQf9RgPkVvEQatEzkQYfFV60bCLYQdII0ToP+vQpxorYF0QDe5d+VTym+QSZnHE
         lMVydiHSh4u4FaEcO5ZZ/2m38r8Weumgxt2YPHRsErF+HMw/vROveTQ7CVlvKa8dz2zc
         z3f0dnxnmnH4VKyRmVwZVIU/Luw1DSKaY7yKQM+KUYkonBKjcExkLsbI6FmWkQHUYmVt
         HfnRD6FIU83Iv9E5Aq9T/cakzKOKbvoAtJX1H96xOPAdjPoEaHknUyh/bRBFSndOXGlb
         Jydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398258; x=1775003058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y9QUfBbiO+kjiELTZ3KNnXYoTbhjP6AEc0bBAmqsZ2E=;
        b=YbAFgdvTIxlmx0MaoD6gBvzSt0tr503uyiFBeuK7wBn4i9bQIKEyohyBu0kMWXQTHc
         JzKurlHZWjwfDc7HQ5H6qaMy8eAqGfsW7brH7q52/txih7QJt09pG0yZVSAzDQBKLQAL
         WM1soPSjWXWEJrQyLFLcgY4SNpGz/8h0Yi1iZsH2GrDXBun9mTZqYXu/CHmltHMwVRcu
         kcXiYt5rmCp6Qt9+VN9xkU6hK552SZUt5rYzFg1u7E1acOb1QZXXSCEtqe6mMX2YI4w1
         MZ3Fc+Tt9ha8kxJH//6YCEwJCwhzRjLiSK+FnGbA8Z5BflD7Sd6mVDAw/ZZ0whTMThp/
         NgQA==
X-Forwarded-Encrypted: i=1; AJvYcCUGzWM1TtXf+t3IO20eggn/RqxoXWwEq2WmTEe0XmFbAoYqL71k8k7V4I6mmdQUix3zPXQD6zpylAXOdrRrRLhs@lists.infradead.org
X-Gm-Message-State: AOJu0YyjqSYQdMjT98UcuFbtSXCi86c6i1UpkOftsEd+YmVOPD6FMUvl
	em9APCtbK8cMD8VUVZM5COgfRZjpDGFuFE4i5HdMt8oFHOPj/FA4R4Zgb1V1f+A8
X-Gm-Gg: ATEYQzwSowx15MbjZLTodOE6ZHAWcTLGE6cAZdm1o4YpI7m40Max4xuVehbYwvPrvyj
	P3hILSYEdPa2cOI8uzCrxY2LO+Ct3nwFN1WwrwttJNJ0ux+uk0ixSpSXl3+7heNIl1Z6pJeyH1e
	8IY1a8o1g4/aXqiDFOm4CAyTlVYCjpfh7LDQ+O0MdD/QqMDTlSdXaRN14xjQJePNuwFLBuw/Ovo
	T1Rv3IamX5iTm4Io++39aNiAPzhZsVEffMuBXpZj1VKpQaBMuNQJ8oeqiwOyEPqU9ClU2ESZV8O
	BAlKU3PnezNnw8VgUPphImwOQBjpvfHImb599uZzoXzx4soeVsQvYEoSS7P7XncxwxVefvK0s9m
	jVkFMUn9wK7biys1jO+bVRYBtIlbrdsqXlPqv46RDWbgprlyulpfOpDjTxpbAM7M6kQmIu5S/ki
	JrBBHLh2zIr/pzqKLDHgJ62COOcKn740oJg6gff7NMVyHswvWwyxN9iBYFPdQoZMFxVFPoB6TF4
	aMhJlM9UvXbyQ==
X-Received: by 2002:a05:620a:44d4:b0:8cd:8ee1:2eec with SMTP id af79cd13be357-8d000e4ab6bmr239394285a.0.1774398258039;
        Tue, 24 Mar 2026 17:24:18 -0700 (PDT)
Received: from jernej-laptop.localnet (16.red-83-43-237.dynamicip.rima-tde.net. [83.43.237.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8fb9c10sm1375930885a.19.2026.03.24.17.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:24:17 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] soc: sunxi: sram: Const-ify sunxi_sram_func data and
 references
Date: Wed, 25 Mar 2026 01:24:15 +0100
Message-ID: <8657193.T7Z3S40VBb@jernej-laptop>
In-Reply-To: <20260324164357.1607247-4-wens@kernel.org>
References: <20260324164357.1607247-1-wens@kernel.org>
 <20260324164357.1607247-4-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_172419_615400_D423FDBA 
X-CRM114-Status: UNSURE (   6.88  )
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

Dne torek, 24. marec 2026 ob 17:43:51 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> sunxi_sram_func contains value mapping that do not change at runtime.
>=20
> Const-ify them.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



