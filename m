Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B20CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 16:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2dc0g/PPsN9pIaKjPWHbYZ5oM9jT1rQwz1YwGMpT7w=; b=Z81Lgtu0ZpOlf3yXRuulaqpQ6G
	1KAp6mgWwAMq7s5aSs8SA0wh2RE+ywH4vRnXeEtoRHR9UrIQi8NCX3YuN9eDIsPDUKHdszvm/uQzj
	ayrERyiUM6Kjl8iczpObAPlPip6acMfPa62+Lp1nlsum4CfSdsHLy91mLRRqbFy9hJDyHEyqgd88j
	PX0gNhOsxPX1hKW63kGWgzKtBh26VNFK41uNskd3OPDSrSIqvs8k30ykGs6PMBzwiLSI4vaMBXa0C
	ROe+V3bbcRf1MLyOFFb1OQw59wUVV7zuIq5jIrWcoy+vO9iPqNH+FGTLOCFvMRpBnvkz++4Qp+nNp
	mvL+Plkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDn2V-0000000GMam-3vlD;
	Tue, 28 Oct 2025 16:59:19 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDn2U-0000000GMaB-1FWn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 16:59:19 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b6d402422c2so1447989466b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 09:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761670756; x=1762275556; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K2dc0g/PPsN9pIaKjPWHbYZ5oM9jT1rQwz1YwGMpT7w=;
        b=cVR0ONbmjvf52Uro0+sO7OcxvTa/y1qdCs7lynaWiuhlrK8BKEWUZ4c+lYfnRqqtbX
         MaLYa4scupKLSJS4pUQNwnawa9D5JauGankKxErDHxgbpaVSRr6EyPZnEmXK4IpdEGzC
         CAE/2LOCOzPWEDDCOrKaAMASKNPsMxy0DGpq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761670756; x=1762275556;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K2dc0g/PPsN9pIaKjPWHbYZ5oM9jT1rQwz1YwGMpT7w=;
        b=pH6GnG2fRsKTyDMJBOsvLrobYd3wFHKyRp/T+iclvL990jJt0KIXbjGSJwJ4eXQ/XI
         W1p7bvD0ZbMFTSRkN4X7AQdAZsVeVbEXe8zGuxa0WuAEFhnaKq1INY0eC5fs9mhsNPEg
         H9tpqUUqMRHkdMLEWNvz0SpdUOZEkSDKSTGpbVOWgjmXW4HZhqDOsYTocFFc6c54Ckhg
         Kf7DBNp8NUiRRMyNclSYhJtv/SuX7Ba7EIbhUkOqkE1+MeFn6LdgT7d/8ftV45BubqA2
         WSVcqLg50y471t1iz/B/JyoZecHWNq9piKPIN4w2klsGow832afboP8pC83vSMbF787h
         +JJw==
X-Forwarded-Encrypted: i=1; AJvYcCXQzGbn2OjkfAFayVbCg2Tue22XjyVZLIKJPpQHtvlvufUS6f4Pbe1nkViGzNxAlNpEuvclko+v9iq0npAf4SzO@lists.infradead.org
X-Gm-Message-State: AOJu0YxwTOgv//opVJ4bQDIFnW2p8Riz2xLd1Z2Bh/aX2KbZaqH3WTNh
	XSZFU818G5+NWibLOukKsC4FQioGLukqZVOmXdw7uS6PbXYDrgGMRU/4+QpWpEzeH0a1j5DmDDV
	MU64QYYLjCw==
X-Gm-Gg: ASbGnctTQehUmB42QLa4tLtzAqGkBZ4Y752KQKDRx/J7S8xJkGUNgwMHeZTTjIeJzf8
	owVbRwXFVyd4LXX34IylCn7eDapc6X95tu5O5rFsjzQ5uLweek2uFMjEIeJg9wJDaAk+9kHHbkr
	Oa6zTidoV8/o7G/Xlr0EgP58gXGnsPlT0CI/tHmxcqV72xVkrWjAnGQVe4yd2BM80OLDgh9M1Xh
	elLbrwCiDEM9C+JeR7oIxa3Jmo8RjgIiEqbjwwmVauwSf7U8bdkjIbwSiZqIwInAhJonpQaeg4j
	mOX4ZCGjH/fWXPGoQNJrPXNHbktK/M0lltcQ9OvnejkD+vbGL96BtU8oaOmF6nBUKkUxkvk7JDC
	t8QLkodnx+NjCUE933+x8jTw1ftlAhwJfnIcyMczEUdR1LOhguWbMg0Nz0cTSnFVAs2fVkkI8W5
	5rkBg6lJG/sRrEQeBapHvChccTioOr4HhHkcVYgzbxXqpkcYsc0w==
X-Google-Smtp-Source: AGHT+IHBVSnCO9kVR+oF/eQ59FrhDKmprKRvcYCXv0rpK2GMRs56nJp7XgCbutmtiRrpCqtKrF2lJw==
X-Received: by 2002:a17:907:3f93:b0:b3f:cc6d:e0a8 with SMTP id a640c23a62f3a-b6dba487a67mr495195166b.17.1761670756110;
        Tue, 28 Oct 2025 09:59:16 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85372e5asm1138028766b.32.2025.10.28.09.59.15
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 09:59:15 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b6d5b756284so1329947366b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 09:59:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUH+oIFsBKS1mqRTEDHjH1wzuaxz7gJyo/Lu9d/Hjs/tfizfeRBS6k9mrn+OKisKFf1EiET4Q3R9kgE5ZDx5dru@lists.infradead.org
X-Received: by 2002:a05:6402:5244:b0:637:8faa:9df7 with SMTP id
 4fb4d7f45d1cf-63ed8cc16aamr3779861a12.29.1761670755473; Tue, 28 Oct 2025
 09:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <ea7552f1-842c-4bb8-b19e-0410bf18c305@intel.com>
 <20251028053330.2391078-1-kuniyu@google.com> <20251028095407.2bb53f85@pumpkin>
 <CAAVpQUARk-XeMdTeGy_s65sdwuLY2RzocGyJ=2_WkhsrFN-bUw@mail.gmail.com>
In-Reply-To: <CAAVpQUARk-XeMdTeGy_s65sdwuLY2RzocGyJ=2_WkhsrFN-bUw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 28 Oct 2025 09:58:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiTN=1Sm5DVnXDtQ-tSiPuz-7QVpgP2vt6LgaEnhbubfw@mail.gmail.com>
X-Gm-Features: AWmQ_blBlp8rG7EHRLe1uP1FYCp4LO5ZZWflvlu1_iOk9v8s-pHpb1shOoMSUXA
Message-ID: <CAHk-=wiTN=1Sm5DVnXDtQ-tSiPuz-7QVpgP2vt6LgaEnhbubfw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] epoll: Use __user_write_access_begin() and
 unsafe_put_user() in epoll_put_uevent().
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: David Laight <david.laight.linux@gmail.com>, dave.hansen@intel.com, alex@ghiti.fr, 
	aou@eecs.berkeley.edu, axboe@kernel.dk, bp@alien8.de, brauner@kernel.org, 
	catalin.marinas@arm.com, christophe.leroy@csgroup.eu, 
	dave.hansen@linux.intel.com, edumazet@google.com, hpa@zytor.com, 
	kuni1840@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mingo@redhat.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, palmer@dabbelt.com, pjw@kernel.org, 
	tglx@linutronix.de, will@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_095918_357711_4D3276A5 
X-CRM114-Status: GOOD (  10.73  )
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

On Tue, 28 Oct 2025 at 09:42, Kuniyuki Iwashima <kuniyu@google.com> wrote:
>
> This is the Zen 2 platform, so probably the stac/clac cost will be
> more expensive than you expect on Zen 5.

Yeah, clac/stac are horrenously expensive on Zen 2. I think they are
microcoded - and not the fast kind - so effectively serializing.

They got enormously faster and pipelined in later Zen microarchitectures.

Sadly, Agner Fog doesn't do timings on those instructions, and I
haven't found any other place that has some overview of the
performance on different microarchitectures.

                Linus

