Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532E7CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 12:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V673JxVOaLJnhRNwY1KkynB6RZb0FVbqE1Xmria2HkI=; b=p3aEfwAvYZe4/RkOKp3B+x8YGA
	Y5NLlBfLnUm6ZkQcPG/NtL+64Fagq8VmfZjysedMl9pGYxr01CMD4G61Ra8UFsxm79N5RdNtaLqS3
	zIdx40uDBzeTSD6yJebJZuIURp29WfmomQd1UKz2UYHFN1U8MZSZeSysl6+E7W940WTcn+fpDPtWS
	H7HrGvM3FFKEoVsrVyiVskRgQpttgQNOjuSeKIr7j+bS/y6x0GEmncsMa+gZ7LXU92D/pvGt92a6T
	7EuYfyZbSt8bfEzzv8nkEqJ7O18fvcfLKv2By4Ni+ERQWqRBgS+iiMe9wns6f8Hhm/HC8EmJ/8zWJ
	4j4Fwc7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRr12-00000001vmM-3xP9;
	Tue, 26 May 2026 12:36:12 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRr10-00000001vlI-25XS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 12:36:11 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-82f9f49e4beso5269045b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 05:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779798969; x=1780403769; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=V673JxVOaLJnhRNwY1KkynB6RZb0FVbqE1Xmria2HkI=;
        b=Z43Iq7TOlSwqz/O64QQezMCe+6uCEq8LuQMZ3HdrE7roAXW4O0sjWZp7fqBGszZHU4
         tKAwvC9h3kIHzDSi0EzNzI3+sqA3b7+Q/dHqRvqrYZRuYEJR8+e7XkqCBSjUCDOLGxGK
         8jp1ePjqRkO2SXuM/BMt7c5HsDW1B8zsGNBPFizop5r6p4hMnh6IR2H/M/+EhlUKXMnZ
         ltxD+JmdcqyMOjRYYFWkORQojRpMA+2w4+T3J92SywujwwcQhBKAmBTDBi0btpwNTFFj
         rCTkJcGkJa3/QXTagfkhRGfGS41ku7GFrOqYmqcuOJNWOKOfWrlQiMXu5OMI1L0tOcTx
         rORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779798969; x=1780403769;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V673JxVOaLJnhRNwY1KkynB6RZb0FVbqE1Xmria2HkI=;
        b=cl8MdORzFGd+UI4V0eqcqAFRlqQzOg/ZEHJvON+sZSWhXWjrWFVjqgkCb5IdI9Z9BZ
         LySMUsD2BKcG+Yc6EJ4kAdwpS8M2eSh+2EA2jDHwjgylfT0HWWlRjt6+XJGCIUigGJmT
         7H0qN0Tx8KlRUOMDuifPli5r0AvmHbJiS+hlDIDYiTIaiLZfRVa2HWQ3ryHwK6OMGT8g
         3rL6QVSne8EHHk9CcySj02MDzihzne89rep9uzB19P2C31LIPSHR8l1d3a/9bx5hm/NN
         F5r3wMjjnIwJNZwo3tUOiE2TfwulsdZog+9TofihRINbkdaCyQjKXUuyLBI/xdgUpCub
         Uk8A==
X-Forwarded-Encrypted: i=1; AFNElJ9yvRHLn/tKQSXtN9xPxI2NqUT5omeJZ++j7zcNc+kIzQAJWgJ3G4OT0iykXYVFnRjlnrhqc/WCtCuZpAl8lTDR@lists.infradead.org
X-Gm-Message-State: AOJu0YzueWOF4+lI+cgHZTO1KAUUHlepf6sRgx1aWXUeN+QvJ0AFj5ef
	G7fDBrvV1/tBPoSqlSHsl1aBPQqdh46dOC58tsKOl3pcK13P0b6RvPQk9Oze0EqGWpGZRlFzPNi
	ZfuGwyGSdEX+ChT6SeoO5TITnLQ==
X-Received: from pfbgt8.prod.google.com ([2002:a05:6a00:4e08:b0:837:aa2e:b191])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:12dd:b0:82f:6841:8733 with SMTP id d2e1a72fcca58-8415f62643dmr17524566b3a.48.1779798968505;
 Tue, 26 May 2026 05:36:08 -0700 (PDT)
Date: Tue, 26 May 2026 12:36:06 +0000
In-Reply-To: <DM6PR11MB3690699A3178F1559D4BE1CA8C0B2@DM6PR11MB3690.namprd11.prod.outlook.com>
Mime-Version: 1.0
References: <DM6PR11MB3690699A3178F1559D4BE1CA8C0B2@DM6PR11MB3690.namprd11.prod.outlook.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260526123606.2488278-1-joonwonkang@google.com>
Subject: RE: [PATCH v2] iommu: Allow device driver to use its own PASID space
 for SVA
From: Joonwon Kang <joonwonkang@google.com>
To: kevin.tian@intel.com, jgg@ziepe.ca
Cc: Alexander.Grest@microsoft.com, alexander.shishkin@linux.intel.com, 
	amhetre@nvidia.com, baolu.lu@linux.intel.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, easwar.hariharan@linux.microsoft.com, 
	hpa@zytor.com, iommu@lists.linux.dev, jacob.jun.pan@linux.intel.com, 
	joonwonkang@google.com, joro@8bytes.org, jpb@kernel.org, kas@kernel.org, 
	kees@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nicolinc@nvidia.com, 
	peterz@infradead.org, praan@google.com, robin.murphy@arm.com, 
	ryasuoka@redhat.com, smostafa@google.com, sohil.mehta@intel.com, 
	tglx@kernel.org, will@kernel.org, x86@kernel.org, xin@zytor.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_053610_539118_CE08C85A 
X-CRM114-Status: GOOD (  24.90  )
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

> > From: Joonwon Kang <joonwonkang@google.com>
> > Sent: Tuesday, May 26, 2026 2:58 PM
> > 
> > > On Mon, May 25, 2026 at 03:29:24PM +0000, Joonwon Kang wrote:
> > >
> > > > Currently, the only known expected user of the new kAPI is our team.
> > Since
> > > > I test if the patch resolves our problem before sending it, I believe it
> > > > should be good enough. Do you mean more than our team by
> > "accompanied
> > > > users"?
> > >
> > > He means you cannot send patches like this that only serve OOT drivers
> > > to the mainline kernel.
> > 
> > Hmm, it gets back to the chicken-and-egg problem. So, do you recommend
> > deferring the patch submission until we find a new in-tree user of the
> > new kAPI? I believe we will not make our module in-tree anytime soon.
> > Or, is it like I still can send the patch and get it reviewed although we
> > cannot merge it to the mainline?
> > 
> 
> It's not chicken-and-egg problem. Just always send them together.
> 
> so let's wait until your module is ready for in-tree review...

Since adding a new kAPI has this limitation, what do you think about the
idea of adding a new boot parameter to enforce disabling ENQCMD at EL0 and
using the non-global PASID space in that case? This way, I guess we could
resolve our issue without having to wait until we have new in-tree users.
Do you think it should have the same limitation?

Thanks,
Joonwon Kang

