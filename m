Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F1FC44501
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 13:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lBMLQxEd7BYJd8Kkqj4N1dnnSWNKtFYutuFtvv5S2hc=; b=332+xUVfIr0F6W5Dg8UkNGBqcf
	+PEGUeyqu8JoeKvup7qIdNES4KJ+ZLAPk/F8ox0VvLnbzPGcasaKxWIKz5f4xjzmBTuaYRNtqAQiM
	Ooh7SoAeYNMGnhGcdO5+pLSXcpVnT9jAtrROE+kITluO2EmcXPC3HbWOaBrC3IikY7ksk5l8AcCkv
	CeiLDVst9lFRRLj7GlJKZ/EqI5EKFZbcKi6R1osiPyn+ZW25rhsHwx4CmZaN7tWnN83mugpB5ZEHl
	ozLmfeV5fdExs0tsA1jSfx1rjFLmKw3iQ/7NEqRlvmri67h0zA3+8kMbbST0XIvSm7K+DSxj5r3Rp
	uYk4Q4oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiu9q-00000007TJy-3MkJ;
	Sun, 12 Jul 2026 13:23:46 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiu9n-00000007TJ6-18ra
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 13:23:45 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ce7d2adef4so30894895ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 06:23:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783862622; cv=none;
        d=google.com; s=arc-20260327;
        b=WTwE0woSNvScmgfW3jm0SJ4S+MSogCy6Tutfu3u8GAPTDNK4mIfCCpTR2aGtqsmAv2
         B+qVsdVYeffchHlbbGujWNoFK5kUBEkk5BzKZRvCseaHgu3BPqCWL8aSLkfpS4wnvnNf
         kz0P5kXdQ5OPqkHsU1huoAs+Buk8VxCQOBEvdyyiQO4z5LHSs9Naou2ludqJ4hupe/rA
         4pP8q1KZ3mBsd1uEjAsWO/wztBQYjszl24t6atjDEuQoQ0f+BMHUCoj/qSczewEJ21bp
         Rkud8qExrKQ6eVJbpfCyU618mBpcsLy/3YhF+PuSV1vTGmjj6DQSgb3Sx6f2WdAF9llY
         EBVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lBMLQxEd7BYJd8Kkqj4N1dnnSWNKtFYutuFtvv5S2hc=;
        fh=nV6GRgjB3tGLIC+5ABvRqBnVJ3yCQf+2/WOq1njcBws=;
        b=eob7OOFIvBn6SLM6HOOtZd8GCszYsDFe6r/hZDTnUwLJRVTPZZ/WUtv2jJORl8/y4d
         tWUDdxF3+PMW1TkX9QEzhptfRignf8YtUnwqgMa3j94+NuHvDKgRs33kscpjaJrAmn1N
         2gb8/plvqY0EuswfJOkDuaAn8Dw9oHhLnOQ4j9P1/h9aDD6S3hdRbFdhed22l4cS3QeF
         0ZVkJjeUQzV9h0RcYXHSXboosL0aObfyS2If+C9Vh46Fr+TfX9ddM5d4nJ9hQY1iHRx+
         U4g1w+HfV1YCdyMOBWnpNF4oednqMY442lR64IjtvFjRxbtvCfty1lbLL9dPNjxJ9JL0
         h7hw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783862622; x=1784467422; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lBMLQxEd7BYJd8Kkqj4N1dnnSWNKtFYutuFtvv5S2hc=;
        b=XkAQTJv5GIfTZKYcJMSH52ORy9zSFm964qfcc4m9Gkfq2zqE1JotAipjvV3nBpZVlN
         fw3YhV1ihuGrVDzVr1/LyBOK1fsRkBNS0LZrFOhrX/xDKto3V8JuSv1Qrc0FEItB/u3m
         TpLp5w2uqttzBalFKa29DF5VMTmuMBSgQrlQcoziuo3PSf2wJ9F1H87ELTIUtIhgeFTg
         /ryb5SSoZitT9D705OEvczysCJKqoi7/YRxsttObAWAF2fTHbbp/r/8A9msBW3Z3JEY8
         YERQHVWjikS/CWCNyFPMdudJdb7M2PwW+bLTGGzH+BxkJcHPjcMnfthn2Qt+AT9IGcds
         Kk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783862622; x=1784467422;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lBMLQxEd7BYJd8Kkqj4N1dnnSWNKtFYutuFtvv5S2hc=;
        b=I5L0lqNSG0jaRW3XYMAws+m/Y9FcSE1Jc3K/LmW1p47jWO5EPKqcMFKoXRBV2NpjiB
         AuX4OiLsuXQZ7uO3/hAh9nqpusbdudqB24lyyzIrL3d6WjiJG7FvqIxYkPCd8bExlB1U
         a3KekUDEj4wtzvfpVMUwCAM80yg1FZhRWLodCxXS7du6rU94AwEz1ICZx1N5DWNSpcGp
         nWOm0sk7qvO8RWSEYuXo/8S9WaTAr0AYLNigzAXfnC8kJHVHm8DIbg0OeBV9gMihE0iA
         bVop+OdEadFS1jnUbmb3KG9PokNFsEyIVQvgZMe6SLX6n/HNvTS15vX3hxJjI61iJLf2
         Z+zg==
X-Forwarded-Encrypted: i=1; AHgh+RrQR3EMbIPsMkKiGLnrj8His4uh27fic6x57wvIAtTq9hQb2ErkIWhAT8/pBbnB12AjRpxg22BQYv8aagB+tRoD@lists.infradead.org
X-Gm-Message-State: AOJu0YwSvfG1EgyW7nwOBTWsAVQz2vNo7G20X2g+fuKUAKrh7WdOB4Ie
	9W/9KGfbbzlfJKb+XUSQH9xC51B/eH1kamq6D7lSArnwB+bReUM2N+SA1w8BfQLc4g0xQNSQcGJ
	ewhQZSc3iB8wK5SEnmrZZPnqEAJm6bK0=
X-Gm-Gg: AfdE7clBl8HGG3WKk2emQEJlPV+Sg9y65uRAcTda4I2Apqpk+s07EtaogeY8+XQ0lCa
	Iuv9lkvh2JNn/spytb/ICHwn7FrPb53kF8O83IROrlTXhE32BOErE74hw+h8EbHDwWjS7mtghNm
	bnJDHqBB2KPlpjLj49acfcg3q5AXGlETKE+XPTd866VVNfKcpqGdd6HyYvivPEYoes7p3bLKuQW
	+Xia+aXCgYrTLseta+Jvyo5BYZqXDqoooWvGlgJhXUJLlD2v4yp0Bggy47rstOAVsIegMC33+0F
	ByA97ciKesTiMOpc94SvcUH4cdX+/g==
X-Received: by 2002:a17:903:240c:b0:2c8:1c05:16bb with SMTP id
 d9443c01a7336-2ce9ec0f108mr56548535ad.24.1783862621987; Sun, 12 Jul 2026
 06:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783673420.git.sean@mess.org> <a11dc2d089d4e288b63412a0d3029393c577ee80.1783673420.git.sean@mess.org>
In-Reply-To: <a11dc2d089d4e288b63412a0d3029393c577ee80.1783673420.git.sean@mess.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 12 Jul 2026 15:23:30 +0200
X-Gm-Features: AUfX_mzypuSkZEBJ20fubf7QLH9Pq4J2Gq3FfCadOdbOn5XOHaqqRDGX3eTeNBA
Message-ID: <CAFBinCAMtch=GJO8mba9zCj9KT77AuDSpybcuH9_1gu1i=Hr2A@mail.gmail.com>
Subject: Re: [PATCH 6/7] media: meson-ir-tx: Ensure rc_free_device() is called
 on unbind
To: Sean Young <sean@mess.org>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_062343_313968_763C8899 
X-CRM114-Status: UNSURE (   8.14  )
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

On Fri, Jul 10, 2026 at 10:53=E2=80=AFAM Sean Young <sean@mess.org> wrote:
>
> Make rc_dev devm managed.
>
> Fixes: dccc0c3ddf8f ("media: rc: fix race between unregister and urb/irq =
callbacks")
> Signed-off-by: Sean Young <sean@mess.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

