Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59148D26293
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 19:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XeUViYfY2uTSAY/Y5mKsJA4QEp1pKU/MT51bOa0VcX4=; b=mTXDhuMI/GJehPH0omaF7eMeq9
	0nhBdc3LTw+JVoRUm/FncYeWY+/pxePWbR63Tym0RvkU7dnLrFg/z6N90taK7X7MJJU7txDnwTzVq
	tsXCErmDPuKZlZU4x4ryrNfNfr+mRT+wHap/kA3dE4gFXiOnDOpENUvwBQ0iXvfLEAfLWjNKf712e
	3VdNR2YCCeIYWCMjqyKRoFPxNzpqBqDVN4LIVGthVy4NuSg/sms7syd9POH/JhVB1WgN9/0IwbsOt
	SC0zg8rvslXT0w+DLvIAU+ucH2/5JfSzL//IsS9oCKjt5TUdDmz3HIhCZZ8lbAdYzIXASD4/sfeVC
	D0WFr5sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viHer-00000004OXu-3Ag0;
	Tue, 20 Jan 2026 19:44:57 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viHeo-00000004OXT-1BKi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 19:44:56 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7d148ddbb91so85266a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 11:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=utexas.edu; s=google; t=1768938292; x=1769543092; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeUViYfY2uTSAY/Y5mKsJA4QEp1pKU/MT51bOa0VcX4=;
        b=xBxV5JENEoaPRprUWTI2iZbq8Cs3EPyf1oP7fc4OcwD3VC4nhQglJndp/m+asOO03c
         Ky6BbJDjoUiRbTjxiRIVfOUEVALBkqh9EVGhiSt7EWIVDiRX4W1LxaTcCI2zV2fr3KOE
         DJn8WaxpaYGoB/ZW550x8tHWIM/n59kz3w3cu8LdP+XZmopzWcVqO5MR5nDFAe34SPZD
         14kpze4yV76tbKLoSrR0wqmA4815d6+vctB5yUj+JKcwDIfN/ZMNET5D5cMIYJxoTxau
         W4htZVqK3LgaxIir9I6QYBtuwzEpEEi6V1vc7DSCnQI4rDgNaiAYTHoChJhUh/ThNd6r
         S/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768938292; x=1769543092;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XeUViYfY2uTSAY/Y5mKsJA4QEp1pKU/MT51bOa0VcX4=;
        b=dlmxK+BR3MNSUCUE/gF/TnDQdSEOSZG/SEmu9nK890iZ3Dk86OC1iZuyywrGX6tM9I
         +TyNpLtORC6llArDt7amspDucXtIG+kPZduCnuj/OZMQttmE3L7vg0VrKLESfYjcS9L4
         n4DJiJWoO7GgUm1YGsSOoxJWvvogUeAocsezib3J63C3BkCPoFI5cRRNCZ1pzozAgknb
         Yh7H/phaYxlegW5YyQXLZCwITLlZlcwUhbpV6BMY/CbigsyhUmzOAyiDrgolaK21LBbW
         hD1hvg/hpK3QJuXH+ACKRAlpgOwGsIFLgnaJOstoMgPCDX1RD7fDK2Zw+S9aE/sztuW/
         rGLA==
X-Forwarded-Encrypted: i=1; AJvYcCXzH8cz6HEF/279TJ6ndwGLBi8h40CevRAAMVmNyjMx0Jox5ipwNFhAPU8ZQFAP2QSSNe5cKiX60n24G79qbTut@lists.infradead.org
X-Gm-Message-State: AOJu0YwidmKtWlGaK7ywarXRs4sD2QMmbOhhdQIxzTqJMivEFyrMw47u
	aM/3jVcxuink5AkT5Qrb1DIJsI5wT8K3RUToIo5SGozT32561ySlJcIXNgKbjw+AuIml6sqkk1A
	2jS8W
X-Gm-Gg: AY/fxX48XOzTKZTOtMMp5F0p/mT6LuanoFyM442091dod6qhTUtUfMu06Il3v03Gd8I
	f88ft8hq+ig/qfiRLbfPmPjyxx+1/AudvOSrs+vHoWv4/io/jjpoNUJyOzCbT7yHdEA302jtXYx
	AQ6U+hDA1BDkwO5zEPQtERfWyYdLN8qNvVIfp3GvTjS796uJOU0gYV9ph+fZ33kinVTpJwgdDXn
	xFf6m+6E1NqzELZS7kr2DZYlvAW7QCvvUAKzP40zCBtw6W5ANIvliZSC0zCcfxnmu+R5axjdhVo
	gC0LGkJW0y89GCIa/MkoeJq9Vt6UqEnFCxfUrVNfD6s1aLt4maG4/+wKyWdIDtL6shZDVqkN0Zj
	sAlcTUltvdFeuCZrmYK1L0Sem0RyB4th2gF4jelw9oRjFs4S6AEVsnQg8a5IFqdejjBvSQdmQME
	ZBCJZPO4xs+4o6vPFaNzjmO5vRudmZDP9OjyHlyMExhl668AK99S4=
X-Received: by 2002:a05:6830:4407:b0:7ca:c897:fc5c with SMTP id 46e09a7af769-7d140ab7359mr1703875a34.20.1768938292199;
        Tue, 20 Jan 2026 11:44:52 -0800 (PST)
Received: from localhost (nat-128-62-18-57.public.utexas.edu. [128.62.18.57])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cfdf28efbasm9258158a34.17.2026.01.20.11.44.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 11:44:51 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 13:44:50 -0600
Message-Id: <DFTOAG3ZYSFS.PHQA8FL20S6K@utexas.edu>
To: "Catalin Marinas" <catalin.marinas@arm.com>, "Carl Worth"
 <carl@os.amperecomputing.com>
Cc: "Will Deacon" <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Peter Collingbourne" <pcc@google.com>
Subject: Re: [PATCH v2 1/2] arm64: mte: Clarify kernel MTE policy and
 manipulation of TCO
From: "Taehyun Noh" <taehyun@utexas.edu>
X-Mailer: aerc 0.20.1
References: <20251030-mte-tighten-tco-v2-0-e259dda9d5b3@os.amperecomputing.com> <20251030-mte-tighten-tco-v2-1-e259dda9d5b3@os.amperecomputing.com> <aW51OPBNsydlJS30@arm.com>
In-Reply-To: <aW51OPBNsydlJS30@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_114454_456924_513CB62E 
X-CRM114-Status: UNSURE (   9.41  )
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

On Mon Jan 19, 2026 at 12:17 PM CST, Catalin Marinas wrote:
> TBH, I'm fine with leaving the logic in this function without
> introducing a new user_uses_tagcheck() but not strongly opposed to it
> with better naming.
>
> That said, the set_kernel_mte_policy() naming looks too broad. The
> policy somehow implies tag check mode, fault behaviour. All it does is
> dealing with PSTATE.TCO.

I agree with your point. having TCO on the function name is more concise
than what I've suggested. We can drop this patch.

