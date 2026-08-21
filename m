Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A165C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 19:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4AbHNYOybKycCffk+1NRelRi+xxrvqfKKYJ+6qV4UY=; b=hPIOe2jnP9NmcyM3Uqiryceo9c
	zrKnnAuTos5mCBbqE9DQ2D0CDc3CggGZoxssPUFHP/Qlx7rVt0PHQzD90zPYB+/DWe+e1TFjyFbhe
	Ue/FOSpZX1qsCV0aP2Xx8x3MTWxZu0dRR5ygdMjLQvGCly7UMi2wS2WsISmxLxHSIIDBOjH7V8VrH
	4MqPtxJ+JYApSpGhNK1/r7/MzM/fHraCfHgrN9Pcs/nWDWRQ7Mxmv4j8Z90juYgYIpq2Jl/LGNXUT
	7dfinYbCQdotXlCMNzRJvfQkyxisOZcm+E9cF2PNO6adPowWV9UJubMN9Oj1Ye88fI67t7wpnhmfQ
	Crv03+Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxUcW-0000000E01U-46R3;
	Fri, 21 Aug 2026 19:09:40 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxUcT-0000000E00r-3kLG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 19:09:39 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c2022323c37so223385066b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 12:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787339375; x=1787944175; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m4AbHNYOybKycCffk+1NRelRi+xxrvqfKKYJ+6qV4UY=;
        b=C5We5Rv06s2aqC5J6+0sAT+lKfkqSnfvsVrLqruWLwhLHmnRUGkarz65bFsc8dYEGg
         7r+6QgbPtyn65FwJs3x45tmEX70GwcjbT3WQt7QM/OEt9U6MWJgW7xot9EAn6ZYG0ymb
         L42ivrpJdlgPx0R4Y+FfOPZPgQ40cWXUjBLDCIr33mDOF5NApiwpY7ECu+9xQDgUPDIS
         snNwlfhWHS6QcKygF329ffCcJTDOVJVWLkAwTuCUIEWHafDbm83fyaroZ1PfP0L4zxNW
         KBEz8qltPzKcoaM+IsmrYEoM9d3GJ/JY8Prc1i1GUJ2IyTZkHbStXZZ+49KpdxdUp6I6
         MCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787339375; x=1787944175;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m4AbHNYOybKycCffk+1NRelRi+xxrvqfKKYJ+6qV4UY=;
        b=bzBJZsBgJLuP8dfEl0WXg1OfMBXXfBOmo69oQORbqdvoBOaSOPTPAKBEazO8Sy0IxA
         BtJEtdXHHfeRUAn+nfDKbdWgL/TkypSEYbOmmX+mH7GbOdT0cuW2kZcTrTbgOmPYHqwQ
         Yg34aoZyrfCjnmdTrZ0NzHB1qDVOnnoBaZs2lPQMPU12mRbOewxLIIJJcf3IHrvZJE0k
         dxhq6WOB9C8mDp46T7I9O+LWeOwHcCAkEH0InkCvYK+Q29CZLtih1t0ZoVanoN57u4DY
         ceIyfPWuY/r1TB2EFeXyvlwZ7sLNjOMtYKqKhpyAxOrvkjgrZAOozZ44cbH/chr0jVZC
         5lIw==
X-Forwarded-Encrypted: i=1; AHgh+RpxYPnOayIJEkX0naI0p9piJ7YvCbamyQDwxxxKrCx3rvaC8HBnlrWli6q3sPSsI6DzEFAA/hSLrUBWgF95eAVE@lists.infradead.org
X-Gm-Message-State: AFuF++k7Vws7HnZJdzbsg34YrIgvOei4+SJwiSPfKf4LeI38r0fveGxj
	odbqJpjef5Bhd7Xxw1G4hbF9qsB9kTnCauHLC3e7xkPWH4ZXb+sIx04S
X-Gm-Gg: AR+sD12oJs+8PrqDj5W8Lw5X0+yIBplD8MBHi2aRYaNe5pcbjoqLNEhbCMQJunN/c3v
	Imd9O1mc5MLGDATP0ZQQ54ejo7h2BsAo3cWYvARV+LkkZnXYKj/MOUOHm10Arva3d6OH1ORlZNN
	86qtqdJiU2Jb9BPuMCoUp2EEC3DAEKoq9qFQvCeNh0cqubOBvK0XqxF398cmHsPaDupxJjIoLeN
	gk51DJBVJGdcPX9NO0sL+fbZ+f6ClqokQtCBifrTNTIVVx/5MRKzBN6HmYq38ff8MrHmJteZdTM
	Aus5vTdzbnoThpsNsIMdneJ9h76Hxlf63SjZ+bNUeEgdSDR54RPxHKhFDyG/LKYA2GlTenR6j9y
	nRIqBP2REZ98a+U01nu5eyx0ZDD2kvqOPyeQdQ2VoRcvVJH2YWbwtzSiIgLMfMND/S+NjXvtHF8
	bpc3ybqsmD9nS4zGbEfj5JxERcOUfsjgbcN5xlPcy+7+abpHIbktj3sut9qKH84mnEHIocQC5OH
	kvtLgOM/vU7ua43HOhR11JD5plbibYIV7awNGHvewwrcdE2oa4msjH1NGi2xjV7XpDdJMpopcOA
	ssOH+ZMq9LSlI4q5PtlfC4DjYuTorBdvfOlt/GOLvzRzyWl3zGZf6rVP0bfammAi9BHJsaHRpcG
	RKg==
X-Received: by 2002:a17:907:97d5:b0:c20:21be:ea75 with SMTP id a640c23a62f3a-c246a33ea8bmr796814866b.8.1787339375197;
        Fri, 21 Aug 2026 12:09:35 -0700 (PDT)
Received: from MBP-von-Karl.localdomain (dynamic-2a02-3100-a103-bf01-4ca5-89c5-9aa3-9754.310.pool.telefonica.de. [2a02:3100:a103:bf01:4ca5:89c5:9aa3:9754])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589e2ab2sm584196866b.7.2026.08.21.12.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 12:09:34 -0700 (PDT)
Date: Fri, 21 Aug 2026 21:09:32 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Eric Auger <eric.auger@redhat.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 3/5] KVM: arm64: vgic-v3: Unregister redistributors
 before freeing regions
Message-ID: <aoiiHw4hBHB7C5uL@gmail.com>
References: <20260819224229.82948-1-kmehltretter@gmail.com>
 <20260819224229.82948-4-kmehltretter@gmail.com>
 <874igpp3qm.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874igpp3qm.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_120937_964688_C5F8F842 
X-CRM114-Status: UNSURE (   9.80  )
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

On Thu, Aug 20, 2026 at 09:58:57AM +0100, Marc Zyngier wrote:
> The other bit of interest is in __kvm_vgic_vcpu_destroy(), and its
> conditional removal of the RD iodevs. Can't we just get rid of this
> whole block altogether now that we have a saner failing path?

I tested removing that block.
It reintroduces the use-after-free fixed by ae8f8b376102
(“KVM: arm64: Unregister redistributor for failed vCPU creation”).

Karl

