Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C69CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 09:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LuiZFKOAP2hQ7MTYXd5knANR52URvsfSk0kr76WNy7I=; b=RXHA6hS5rW1+FbDcTQKFUb9Lea
	kZL6U6A+UO9iHqzMBxb7/l0EufpeI16M/f2cfCbJSGGYnvC74t93DdfEIkFoFhRolRXgv9600VVXM
	CBnHgSHKN6QtEPqqAGMQKczGiLjPvLupU7bSAAO1qbPFRQ9Sh6dM+d27Sfsfk0ozXPu8D5eQke8ae
	mr/tQoYAOirpdjlOymGuITbEbbYcx3aYNAvPaVuh8fTPL/Qk5IFULgHL8ng6UAa4g4ZrwgypDjSIK
	hn3f7vDAewPitc1vqmuYPTAcfrefl9wchMU3BT0WmoMETkmp6Iks5/htRD7tKtTORg12vpTqx+by3
	RhXPpSZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzuv-00000007LEe-1Kru;
	Thu, 21 May 2026 09:42:13 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzut-00000007LE9-0UJZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 09:42:12 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so28694865e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 02:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779356529; x=1779961329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuiZFKOAP2hQ7MTYXd5knANR52URvsfSk0kr76WNy7I=;
        b=AVvOZbFdGbTt/ucDLkcqodeTuRdAX4gTP6xjeMBNse++ue4E0yYv0T4/p/oFGFpK7T
         R4mZ5+kRKD9S7wyZC3lSvCtDJHLkxqCE7X5yZgvim5wfeY4Gc+08w94P2/VjIMrlmRZJ
         WzTWoKPwYw2ir90ymv2aV1+9+hAnBZZWthZge79UpZPgSMJfuEXVq3kUitG9w1VsGxkj
         O5CmkoTrF+Qyjj6w7u5Bwh5tDUKMuRWWbOf49jHBVXnLfSpelpJXvhyBG3w5hh3Pt8aw
         rgGld0ByGtJnbaPQb5Wn355EodaJIQdUzs32u/kvpQqX/FXMcAg/ZPRfnhXK3PAtclQX
         xEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779356529; x=1779961329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LuiZFKOAP2hQ7MTYXd5knANR52URvsfSk0kr76WNy7I=;
        b=YWh9RupQEJAckfnVnd11PnVDg+L6qh9Yhq3tlfEFutHWjG4tORFpTvac1HnZyrfBPE
         tLCjc1sHg/K6PCWyMve3fcdbjFZxHo8aCbvRqu+8XcXxk7Ie+5YYjY2wdgXIsAp3C3hj
         BARkg8hSVnICW3CCNvhymFT9b6yfdCLFJW32giyBGZga5UVaL4UgSkXTTmRDBlRc9Oru
         gMIrBr4qaZeb50VhH82FTTApzrrXFpmLx+PDrFWAuunLoUhJm1jdsfljiy99iTB7Q/am
         HbTuNg+GKKoNe66ehJgJ8vfWIohMG3t1ZujpjQQpJiv9boq6qWtLkuNoFXTUDnNPGxXC
         QWUQ==
X-Forwarded-Encrypted: i=1; AFNElJ+g3u6YxERTKR7q1FPgy+ZHelnUJSYNAOL+33bf7bRwHQlSJe3VonczAM4yjZWjUJcN6c4ps8beMAlaoSrVI0Zl@lists.infradead.org
X-Gm-Message-State: AOJu0YwpmJVcf7NNu26Jxwgs75eoNnx9WFfkF/IuLiCzPuL02JPPRadx
	w2/qsk/Tm9EqdyZpyZ464r7ryAAQalPo0gg2Ujrm8ulgHRbRRpzadgJ9
X-Gm-Gg: Acq92OH/zoa3lPmm1KCQxqACjMho/xCvB6I+K/iqeyl9dNsoDbFC6Z35C8tbTdWdJHS
	MtaTv4aBDOOiimCv/fyFguNOwYFTqX0JaJnu7VGNNhMWSse2c7A2CoYYn5REB8aEcJAfD05VZH1
	nPdoJ77BTz5b95p2uu7l1+4ZLH4F825fepZFBfanr8XqQqKWokwXNZwqfEF+AeUS1H9e13dpPA1
	bSA3ZwKdq8a4UHIOGIT6/4tVNxG0AHIpEtmm7jD/hc1aJlrvl70HUZYfdRRdLq5bKjlEd92TXmC
	A3a+7vM5aIHiCBjKu8v20IK6oDadyv1MyZ05sTVOpmxI2Lwnk9IB3FvBh44Eq3seh/Jhyy2l2Ot
	jgqjuCJxdRjCu1HqylEBuP9MaMItuRuKBvagzs9/F3p4Ahh+b+iprbhlThKeT6u7Z/EGcFExYNX
	NWws3dWYY4aE6e1+fsknwmv8Q+fjN+mAdV6UmVnUErwkUn3zuP4zfwFqW7BWh02VmO
X-Received: by 2002:a05:600c:1512:b0:490:2153:2c3d with SMTP id 5b1f17b1804b1-4903608957fmr16164075e9.20.1779356528456;
        Thu, 21 May 2026 02:42:08 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d8e71dsm50329955e9.9.2026.05.21.02.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 02:42:08 -0700 (PDT)
Date: Thu, 21 May 2026 10:42:06 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Ryan Roberts
 <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Mike
 Rapoport <rppt@kernel.org>, Linu Cherian <linu.cherian@arm.com>, Usama Arif
 <usama.arif@linux.dev>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC V2 01/14] mm: Abstract printing of pxd_val()
Message-ID: <20260521104206.1c7d3fe0@pumpkin>
In-Reply-To: <74f66e30-ab3d-4352-89ef-1bccc7e9daeb@intel.com>
References: <20260513044547.4128549-1-anshuman.khandual@arm.com>
	<20260513044547.4128549-2-anshuman.khandual@arm.com>
	<74f66e30-ab3d-4352-89ef-1bccc7e9daeb@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_024211_163048_C275C226 
X-CRM114-Status: GOOD (  13.02  )
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

On Tue, 19 May 2026 07:28:17 -0700
Dave Hansen <dave.hansen@intel.com> wrote:

> On 5/12/26 21:45, Anshuman Khandual wrote:
> >  	if (!p4d_present(p4d) || p4d_leaf(p4d)) {
> > -		pr_alert("pgd:%08llx p4d:%08llx\n", pgdv, p4dv);
> > +		pr_alert("pgd:%" __PRIpxx " p4d:%" __PRIpxx "\n",
> > +			 __PRIpxx_args(pgdv), __PRIpxx_args(p4dv));
> >  		return;
> >  	}  
> 
> That's not the most readable result. Could a printk() format specifier
> make this nicer? Maybe use "%pT"?
> 
> 	pr_alert("pgd:%pT p4d:%pT\n", &pgd, &p4d);
> 
> I _think_ it could even get rid of the p??v variables.
> 

Adding another %p variant that is only used in a few places just makes
it all harder to read.
Perhaps a local helper that lets you do:
	char pdgv_buf[??]:
	pr_alert("... %s ...", ... fmt_pdgv(pdgv_buf, pdgv) ...)
might be a reasonable compromise.

-- David

