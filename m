Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346EAC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 18:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=79LobGIFN/g0FwF2NikibVInqu9FRxv0v1rsKL+0J5s=; b=Lk/By8G5xr8eYYmV6LL5NPZRPt
	m8nhJud4sgizrJZsl1IiB7wrELtKVky6VYlv0z2HGje4uD/+R6n670NNsrcI5sMgR/w7J+VD2jyWS
	nbrf/CiRWhxTw9VRFQueSAAXxZmcWVOGzmgWGTWPxId7BJBKoqIFT8kS0glRCxtNltcfHI1fflDpG
	hbnUG7ypaCyHtNCw+hxj0cC/5elJtKRftrdkZ8SDDYr2U4QrXtH6orqb71prKDNkp9rnF0H2RyDTV
	lRvqUyacxQmd9CWf/g+acystwgMI5LwpfNVySXwGqtB2+vHur5KG3lC21hC9hQVzCia0PYqM/gGpx
	mNUiFErw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4OZx-000000036YF-1Gjz;
	Mon, 14 Apr 2025 18:30:45 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4OY2-0000000365U-3gOG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 18:28:48 +0000
Date: Mon, 14 Apr 2025 11:28:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744655312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=79LobGIFN/g0FwF2NikibVInqu9FRxv0v1rsKL+0J5s=;
	b=dSjZVNznhibE5ImQIIfmmYSCOEzofqKsfqXGZNrhtpM/7rWjE+O4flqhBfgr5HDSfKQHPR
	YBw5wp5OGPuj3czpGhC3nHMcfr4enPcFZPyfeO6MgofxP3O9atH+Z2DrN4HJ9OLmMz7yXe
	bBaA08prdifZ5EgLcXYZKc1nO9Qvlt0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: David Binderman <dcb314@hotmail.com>
Cc: "maz@kernel.org" <maz@kernel.org>,
	"joey.gouly@arm.com" <joey.gouly@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: Re:
 linux-6.15-rc2/tools/testing/selftests/kvm/lib/arm64/processor.c:107:
 Possible int/long mixup ?
Message-ID: <Z_1TxzniVGAS6gcp@linux.dev>
References: <AS8PR02MB10217FE659681FD584050156F9CB32@AS8PR02MB10217.eurprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR02MB10217FE659681FD584050156F9CB32@AS8PR02MB10217.eurprd02.prod.outlook.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_112847_121997_A9866F91 
X-CRM114-Status: UNSURE (   8.17  )
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

On Mon, Apr 14, 2025 at 06:02:45PM +0000, David Binderman wrote:
> Hello there,
> 
> Static analyser cppcheck says:
> 
> linux-6.15-rc2/tools/testing/selftests/kvm/lib/arm64/processor.c:107:2: style: int result is returned as long value. If the return value is long to avoid loss of information, then you have loss of information. [truncLongCastReturn]
> 
> Source code is
> 
>    return 1 << (vm->va_bits - shift);
> 
> Maybe better code:
> 
>    return 1UL << (vm->va_bits - shift);
> 

This expression is at most 8192 so there's no risk of truncation,
although the return type could potentially be improved.

Thanks,
Oliver

