Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4630CF6BE1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhHVpmm6cn0Evt8+6jEIvC0I0kxkUKhVIQcPiY5EtAs=; b=sNzdtbuRzwMHZs1YVXaw3VMDyT
	RHyf4u+aoh74dEVQTdyl30r+FmektphqaB2dV+KLP9gIYaK2ikXOokI2ztUIq3eoo0AGMysr6zKX7
	ZYf9IKZpx9SvwDBprvzqPPb7DGMdZ1jr6PzWsNywDt9W27K1BdYwfBgF7TMiWkV090EWDCG7JVv85
	39SaRF8keZdoNnK10BU12W/26V1+usL8rDk34dGdvtoWHN2IxxTWwKNSQ+nBG8clVL32gd97D/uL9
	DNkcNC9xT2z2Cu52u3gnWJsR0t27xyBhFe/LlB3nrDthGJNQ0Vsusikv6UEpsMhWrt2l01+QxLKHT
	Xv7UTS6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWWW-0000000FJXk-3s3C;
	Wed, 07 Jan 2026 16:36:40 +0000
Received: from smtprelay0010.hostedemail.com ([216.40.44.10] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWWU-0000000FJX0-1lRk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 16:36:39 +0000
Received: from omf03.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 02B501AACE2;
	Wed,  7 Jan 2026 16:36:34 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf03.hostedemail.com (Postfix) with ESMTPA id 8B1E560010;
	Wed,  7 Jan 2026 16:36:31 +0000 (UTC)
Date: Wed, 7 Jan 2026 11:36:58 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, linux-trace-kernel@vger.kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, jstultz@google.com,
 qperret@google.com, will@kernel.org, aneesh.kumar@kernel.org,
 kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 28/30] KVM: arm64: Add hyp_enter/hyp_exit events to
 nVHE/pKVM hyp
Message-ID: <20260107113658.6647b6c3@gandalf.local.home>
In-Reply-To: <86a4ypmqts.wl-maz@kernel.org>
References: <20251202093623.2337860-1-vdonnefort@google.com>
	<20251202093623.2337860-29-vdonnefort@google.com>
	<86a4ypmqts.wl-maz@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: x4udjx1eez5trx587ipsm619xq7kn66b
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 8B1E560010
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18n7XnQ6iyL5ktIei/Ah4wQyDbpnc0P5VQ=
X-HE-Tag: 1767803791-100275
X-HE-Meta: U2FsdGVkX1/WAY6vrp1YLOm63QkIip39ElanvjPPfuAOYqR+0PkitkXdNF5vduNxqH7hbx3vdax6KDhWUUbUzPnwPxG1z8Z0TlKFsIxXu7dhnp2VWqZmb4yU/UoDH28iIi8dNGBfsDkc+lvfIV7LaHyZ/3jxiOvPhXAbnIUMhsKFjD0BXdEetZrT819q59iAG/O8xNdvnLyFydVhkFuVHmYHZG8BTASmkQ2T4JY0UkeHgr1wAZcZM8xdwBZlOZyAGjL7LkebHfTcc46WCKEqthpCHTzQVqT1WTVOMyIwg7l5VKfiu/Z8tJ+5uCFbw+BFHjoLKy58JmxxsBFO2gbK16jf26jTMygn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_083638_518317_F4616F38 
X-CRM114-Status: UNSURE (   7.37  )
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

On Wed, 07 Jan 2026 14:37:35 +0000
Marc Zyngier <maz@kernel.org> wrote:

> > +static const char *__hyp_enter_exit_reason_str(u8 reason);
> > +
> >  #include <asm/kvm_define_hypevents.h>
> >  
> > +static const char *__hyp_enter_exit_reason_str(u8 reason)  
> 
> That's one ugly hack... :-(

This is basically the way TRACE_EVENT()s are created.

Have a look at include/trace/trace_event.h and include/trace/define_event.h

But I have to warn you. You may need to wear ugly hack proof glasses ;-)

-- Steve

