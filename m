Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE22AFF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 11:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcF6L+ouo2phzgrYxWXEm0FomSct1ef1g+27VqW0usM=; b=ImabKkDCoKK67Osdzkr46I9ItF
	DjQa+RreDlCYK8n5IV5v5cTJyipKJBC4U/O2/6+pFrkMi1sbcLS4SVLJlzge8sUF/Ka3stBxt9aII
	jKe2ibNztyZoxa5TZJ1DvaIfjYp0VVZonx5iaz2b9Asj0s8N6XQRYWZlgwEr/afc00p7AiczvUf/Q
	O6gmvHgq3DFpcwJ3L9H0dvcAzlH3rc4TFSrT6VBbKVawiJFxfir8UnQ8y43zYXc6VZd/IGNquVmgX
	uZCgIzbaatmNYcr7QWwBt7tae6s8GTSoY4nc0wz6uzgJ9oj/8EjpbwILn1xFuo5SKtKDQKH0Flb1i
	7PPc+eVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHgOy-00000001IL9-1D9v;
	Tue, 28 Apr 2026 11:14:52 +0000
Received: from mail-pj1-f73.google.com ([209.85.216.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHgOs-00000001IFj-1XeT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 11:14:50 +0000
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3594620fe97so24953562a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 04:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777374884; x=1777979684; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bcF6L+ouo2phzgrYxWXEm0FomSct1ef1g+27VqW0usM=;
        b=BABPtLDVOrLsnN/kHSO/GRtgLi/STTjTd9TKOkFbsYobJxOJCESAlNJoRknesacMc2
         J/UBtWtdvzekrH9ueAZAqqFmfBBAriy/wpMfIwm9Wug78CpKXQBxzV/lEqo5emHhwjwx
         AlZJ9n0s4oGfZn6EWf0eX8coS9E7ON8DoVjZcTGrAHCEytv3tFJfmQdAHnIVuQCdlQeU
         1onJPpBlAGgh9/z1AefKXsygHhnd5HfntAajHoAjjyEM04OsS0EFaLYXYhxfjAy07r8r
         yJXm36PD/4omPBDOm/W4qkymi2rSatW84YU3buCgeJ0FyqOCOTSWFE2iYX6rieT6ltpi
         hoow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777374884; x=1777979684;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bcF6L+ouo2phzgrYxWXEm0FomSct1ef1g+27VqW0usM=;
        b=CwbcPfvoFlV7tVsAFfBaV13VKy666my3+f8LTAsBc9q1TMSxZAtjbHN+jCToIeBdHb
         XMC24QN4ShsG5p6xBtbvncnF2+Mmd//cR9Y5c0Wb0I6zuj1UgvGL7iA25CKDY6RBGw42
         9rM+lt5LzOGlejdNoGfK5B4v7KcucR6n9StpfVz7PzTQEb/NpQ9d9dTUBhuWJ6R3ePx2
         7yIzInRjwUku2LVp/cpwzBQTEd5bMN6csp/Ni4PZMKQrh7T6lYsF5HOkl80TELgep4pz
         SRaRD0EbB7BfmN2EmCTnuCjQzru5FBVP9ftkwf5yHm4eraT6NqRklI09Y7XLBxZ8jVL0
         PUMw==
X-Forwarded-Encrypted: i=1; AFNElJ/HNmg2MSDbIf+AI9vns4dBzhmdmKJDnaSTicoqD60I5HkFFFli1ln9a4iVVd7Eht9DA1eaYST60P5nis4lVJ8u@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu/09YvQE+o9RthDhOiEon8+ZYnf8AfTe+e/Q2eN619+lrW77J
	DXrs+Tva7HndsAAy2BXLssiQvNqQpewJ6tWwj50r5BIofzVxS/1HWsI2pV4sri2ib5xa+OMLX8T
	gYHonwGsnjmIIFIC8Wd472LDSbQ==
X-Received: from pgje5.prod.google.com ([2002:a63:d945:0:b0:c7d:a430:c5f])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1b10:b0:35f:b6d3:da7a with SMTP id 98e67ed59e1d1-364920a55f4mr2779149a91.15.1777374884382;
 Tue, 28 Apr 2026 04:14:44 -0700 (PDT)
Date: Tue, 28 Apr 2026 11:14:42 +0000
In-Reply-To: <20260428090522.GA3048463@myrica>
Mime-Version: 1.0
References: <20260428090522.GA3048463@myrica>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428111442.1584248-1-joonwonkang@google.com>
Subject: Re: [QUESTION] Is the ARM SMMU v3 implementation designed to always
 ignore SSID when SSID_VALID == 0?
From: Joonwon Kang <joonwonkang@google.com>
To: jpb@kernel.org
Cc: baolu.lu@linux.intel.com, cychu@google.com, hhchung@google.com, 
	iommu@lists.linux.dev, jgg@ziepe.ca, joonwonkang@google.com, joro@8bytes.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	robin.murphy@arm.com, stimim@google.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_041446_427659_56216B38 
X-CRM114-Status: GOOD (  26.44  )
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

Thanks for your prompt and insightful answer!

> Hi,
> 
> On Tue, Apr 28, 2026 at 07:38:59AM +0000, Joonwon Kang wrote:
> > Hi team,
> > 
> > According to the ARM SMMU v3 spec, I believe that SSID should always be
> > ignored when SSID_VALID == 0 and the current ARM SMMU v3 module
> > implementation in the kernel seems to comply with this without exception.
> > For example, when handling an event from SMMU, the implementation checks
> > SSID_VALID(SSV) first and ignores SSID accordingly. If there is any
> > exception to this rule, I believe it is a bug.
> 
> Indeed

Acknowledged.

> 
> > Is it true for all the current and future cases? In other words, is it
> > **mandatory** that the ARM SMMU v3 implementation ignores SSID when
> > SSID_VALID == 0? or there might be some cases where the implementation
> > needs to refer to SSID even when SSID_VALID == 0?
> > 
> > Asking this question since our HW may not be able to clear SSID when
> > SSID_VALID == 0 and so there might be some garbage value in SSID at some
> > point of time(the HW will have a correct SSID when SSID_VALID == 1,
> > though). If the ARM SMMU v3 implementation is to refer to that garbage
> > value for any reason, the result would be devastating.
> 
> At least according to the architecture, SubstreamID is ignored when SSV=0.
> The SMMU is allowed to propagate the garbage:
> 
>   7.3 Event record
> 
>   * SSV: The SubstreamID validity flag
>     - 0: No SubstreamID was provided with the transaction and the SubstreamID field is UNKNOWN.
> 
> But the driver will ignore it.
> 
> Same for PRI queue but in that case the page request wouldn't have a PASID
> TLP prefix.

Although the PRI request without PASID may cause unpleasant ATC flush with
SSV clear in this case, it does not lead to the implementation referring
to the garbage SSID. Is this understanding correct? And while this case
seems to be handled solely by the ARM SMMU v3 implementation, do you see
if there is additional care required on our device driver for this?

Thanks,
Joonwon Kang

