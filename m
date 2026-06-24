Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A05CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 12:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7crjkX7xxDZ9ZyGUXr6JqBDMyWiaXIEE/qm3XJmLi8=; b=Ei9+I6XmWmpddWjcm/ddJax0Dw
	59eSeyrpZvhm1W57ru57hgJ353LPeUBsR1hh+9Sd9EL8gVyvNP8nRRm7qCV9qfgXOOk5Twl/q9pcE
	ikYNXde9wZ4Rwfol7P1SkpJxDubWt8EGpjPSoMVRE7JjAn/PpYPt+75cAgXy6vNFnz1YVzsZL51MX
	OVCnM18bIs34VnK1gItvraWsIDIBNbSTiG+7aKYx66PwCGrGW+svZ/yDMvuDyZJ+af4rU1QogEXPU
	qq67HEGP2A7uAbmkP8MQu7mH/ec+BZeDoCi6g8BJm6+JxQGNj7o6BZDBQgtizCM8QCzsYXP9YSuNa
	X/sNPstQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcN1t-00000007mAr-1UYC;
	Wed, 24 Jun 2026 12:48:33 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcN1l-00000007m97-20Nq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 12:48:26 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4631679f204so1085011f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 05:48:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782305303; cv=none;
        d=google.com; s=arc-20240605;
        b=gmn6AQ8NrhnDBbkxqJpRQ15DG3M9hBJGP4FHNeQSX5AliFibmCFM4VP9HuYHDf6a2S
         ufQlGnTwnghQqksuadoRPJRIbHQwTMIs5mmyF13dOvspwzj7SKWKGzjliXJ/Nut6HCDw
         XxHpqvzWtlwFWoyzBtmXqjM30/4WUJncAkEhhW4h78HI1HduaDAb2vYjNokzZwke8+aw
         axf+1CqI111V79vxNtC47B1npsOfjp42ni9oI6i4yG0KEFUaSNEP1B7kJNesekLW4XPg
         yhEb4PNfEZaVGo54sMzCCq0x5lm8UQB3gSaMKkenngKQ6iAohqdY/6NwaZ7KWg7p1q7n
         Udcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e7crjkX7xxDZ9ZyGUXr6JqBDMyWiaXIEE/qm3XJmLi8=;
        fh=Q0w+vspRq2w4jKi2BGp7gS66xj7DQ6LBze72nRZXKrw=;
        b=GlCRuplYQKJn7D/vio54S/9AbzbfTOqMn1Wr1NZXB5laZkBNbQ+dWDmnly/uRGzKy5
         L2K92mMEF3pNk0HzmgZPM2Lxw6HHdURB3vdXjN6T3xH/aw/b3/nXdgFhonZi3RgDHLV5
         fXlyGdX9vCr+3QmHBHppkqBjdJoP9E7t4++31jzJjnX8dF7bsV+Zq9nxxWchFewzKJzO
         5vSncsDN5T4iJodQONIueRkwUvA66t1Z9jpXaHj9cRU1kOIjxDUz2j5kz7xR0WsKBXhx
         p4fLXk4q20GRNzGkRNXjrrLeUGsPdBCMXA4J1L1clR1TayDDTLhorOjmf2GlkU7hs2RR
         HPJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1782305303; x=1782910103; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7crjkX7xxDZ9ZyGUXr6JqBDMyWiaXIEE/qm3XJmLi8=;
        b=GH4kSYkq3ut2mjLXxnzwhjzYVuW2v7vkOMSOHWRiU0M49E8xQXNQpVknGogtzStC5i
         yihLqzYC4LvjilIIKr/hG5JtSCrHMoUzGEpD8RBctczpeQqV6MF6W8WMtPmGcUqQ/0l/
         rmy6Qt/XXqSzObyizgKsaoijYZm8miADJacqSI3C4Blyp8EgLTJU9LswwEr4ThOVCdc+
         c2DjMZhJyiXSyJmqGKjdWH/4TahK1XPzpwWt/rb1i0UtwwI4Nd1O+QQYC6jIGD7Z1zVl
         O/i/LqBiXt9JQP3QyphlvjALRwnARtZ6yUgo7cuYpVKbBUznbYhG/v8Z66ljOwgZ/1X3
         Zw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782305303; x=1782910103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e7crjkX7xxDZ9ZyGUXr6JqBDMyWiaXIEE/qm3XJmLi8=;
        b=p1j0CcIb7wEjA/PTpiljb4MxJsV/34s0kx5IJ6JNzz4He+B/yf1ClojQhKu7k4w7KW
         G1KnJQ8ypO80vxErMl0wWo0pgXFJHV+8Jar6c2IatuFczL09NNCNvu9JuGZfU5CyRqiz
         KnzUpcMsQcHzw7pFcqOn1+2NvyNxVnzHsQGD5GyK5Wb3K+xmNvhEF4CJEZQNOfNNfXrv
         KWIhCjUKVlyxKVhDEU3w+2WiexQpd+qoG9rKKaA/yQFUh3onyBvlAvOG8beXhLVODhB0
         F/MHucKaShzjzPUyI0EB2nPj6nzBB+Dq3CgfAxtFrdEvQ21TJqo9Jogho0zShWz2obX0
         Z+kQ==
X-Forwarded-Encrypted: i=1; AHgh+RqXxJzKCi5ZkhHVHUzYJmwT22iLvTESId5lCRLz9b3xZZmzYsNMTQ9jME3XrtcYDqEPGrYJl6uQt18+5Tnqtd3f@lists.infradead.org
X-Gm-Message-State: AOJu0YwgUhlfo88zxgyU4BO/kwj6IIoh32Dq4O32fhJrpH6FfnA903jX
	XBGRtOY8Z4PTid0H/OtSIN8LaY8QLWOqgHTblROtSrLkiGx7R6wGljpCpAjjqulW6aWVh+pULrS
	jZteaTpfhhLvH9OvGxYEdXoI115eJraK66wfg8EEpRQ==
X-Gm-Gg: AfdE7ckSEkpqCVSMBzt2NLKWXQehZvUPQiezMdPXzLoLtV3Rgzg+cdLF5SkO7r55OjB
	wx5mZ3Dw884MWLImuSZxEJbKMKJNbdl/ER4sQAo9A/ddGQhUISn+1pogtWvBEZmqKpcquauhITp
	Tf1tHfrJcLQZvgxDsVLNMfMWvpZQ9VQFZVy9iAdhEjVhLA65De7XdPoKPSNOt0aDTumKo0sS2T+
	QkHgFFa1j29JD/8YwERqO3yZAvKZL48Xzu1Q1YHFaKF0kwk22o0w7Llc8vHLnCnudPOGtgNS5lD
	SRzD04AB+Af5R78h9uVweNi2ptSN0HSrZbA6lUW3z7j+AbMd/xx3FMVv/Q==
X-Received: by 2002:a05:6000:2488:b0:464:c5be:37fe with SMTP id
 ffacd0b85a97d-46d04d45829mr417638f8f.15.1782305303554; Wed, 24 Jun 2026
 05:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1782224059.git.gregoire.layet@9elements.com>
 <80d983887dfdfc7e70a6db95f8cb95b7312f3044.1782224059.git.gregoire.layet@9elements.com>
 <20260624-realistic-spiked-parrot-db1d9c@quoll>
In-Reply-To: <20260624-realistic-spiked-parrot-db1d9c@quoll>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Wed, 24 Jun 2026 14:48:11 +0200
X-Gm-Features: AVVi8CcfDxQiwuKN4se3SFXuUd_U7WotHtCQRVpspiQz6vxahSkFlSb2JfFBv40
Message-ID: <CAFi2wKaL8qiv_H2GQ05CaeBDQwGvHdjb+dqmjQrHHzWNK6qrtQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: serial: 8250: aspeed: add compatible
 string for ast2600
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch, 
	jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_054825_560858_77B28C4F 
X-CRM114-Status: UNSURE (   7.49  )
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

Hi Krzysztof,

> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets. See also:
> https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/s=
ubmitting-patches.rst#L830

Oh okay sorry I missed this information. Thank's for letting me know !

> This should be oneOf (by convention and actually more accurate meaning).

Acknowledged

> More important, where is documenting of the actual compatible?

Yes, you are right, I missed it. Will be added in v4.

Best regards,
Gr=C3=A9goire

