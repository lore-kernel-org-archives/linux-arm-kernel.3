Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65EEF3D31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 16:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qjPKu8VvxxZ7NIRLqnz1DURhGFwYZzjztChaia0lI1A=; b=AAByXyCuDRS3BaD+dvUqKUWhVB
	B275FlLuG1VSsASCYzQ9gadHv+Z4xTRH+5Ujo1YI1F2pxx/kI84Z6tsYPzadfpkeQ88OT65pMi7bv
	h00nkqOwNYzqsqVI7yQ5XfhM6xPigT+ziQv7DyOWGjryfKpsz5yWV6bIit6ma45BQ0RJbXYfLUDQy
	KM5JwnMHC8Bxa+8HSXzZazVrzaZKxgztWsBDNEOwNB8aitR+LlGvVCFRA/LOA7SyC20qvTEjwqTNe
	nXf/CetwPwCSPOp3yl5KVoA57CWxsYeF4kPnKWSRadq/rVSyKTWbS1Wn6mMY17DdTYRnwvTSH2sML
	2DLBKvcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyBNO-00000002C3s-3Y8K;
	Thu, 05 Mar 2026 16:16:38 +0000
Received: from smtprelay0013.hostedemail.com ([216.40.44.13] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyBNI-00000002C18-33an
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 16:16:34 +0000
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 7F1AFB6D06;
	Thu,  5 Mar 2026 16:16:28 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf12.hostedemail.com (Postfix) with ESMTPA id 06AAC17;
	Thu,  5 Mar 2026 16:16:24 +0000 (UTC)
Date: Thu, 5 Mar 2026 11:17:03 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Marc Zyngier <maz@kernel.org>, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, linux-trace-kernel@vger.kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, jstultz@google.com,
 qperret@google.com, will@kernel.org, aneesh.kumar@kernel.org,
 kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 00/30] Tracefs support for pKVM
Message-ID: <20260305111703.6346b243@gandalf.local.home>
In-Reply-To: <87cy20eeg6.wl-maz@kernel.org>
References: <20260219150307.14538-1-vdonnefort@google.com>
	<20260219130220.063c8db3@gandalf.local.home>
	<87cy20eeg6.wl-maz@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: hjpmqngd9ddfjxdxzzo1w4jhxdng6wmr
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 06AAC17
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18CZlcLb/ptcfAuAKzvUKSGTao+9oqfTCI=
X-HE-Tag: 1772727384-772492
X-HE-Meta: U2FsdGVkX195vWpGBKWyqUWB3sgYzypwSlcv/h9gmg0TBmzfLJ+iJuAAW7JoYt01B0eByBfm80sD9DsxCpM5Ex95OHexPsc0qFg16Hge7QLPHlxS+CQvGowxN47UNGBfUGBYJAeypKYP61yfPCSTq57dgAktN2PQfGNpmNcjcxvNgvSLjaZSXDBiZXfmjSlbmObRDIyv7zNs6C/sXoU8ONKtSpvgWKfR9FBm6yGPlDmT0QM9iMzDIaOkSFBm0/8rPcd5RZ3lAfWOEw7woBi4TGjkhIBBHHU14acjwV/t5MLjLqx9u72DWZm7uc0EJZDjZkniDWeZDYruIAyHW8+voCjfsUJJEiDQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_081632_824979_B500A7F5 
X-CRM114-Status: GOOD (  11.41  )
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

On Thu, 19 Feb 2026 19:11:21 +0000
Marc Zyngier <maz@kernel.org> wrote:

> > 
> > Then the arm/kvm folks could start with that branch and add the arm/KVM
> > portion of this series on top of it. This will prevent major merge
> > conflicts in linux-next.
> > 
> > Does that sound OK?  
> 
> That works. Just send us a link to the branch after -rc2 and we'll get
> that sorted.

Vincent,

There's a few minor conflicts with this series and v7.0-rc2, can you rebase
and send again?

Thanks,

-- Steve

