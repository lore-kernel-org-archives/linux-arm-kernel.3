Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1313C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 08:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJRz9UsvtPUogXEuUq018MMm0hDrqct732z/+RmQUpg=; b=DlwgM99i/vK8DdAi1G2uJUe3R8
	3R5yX8lOVM+8CLDGtD3stRxugYD+VHi9Eq5pnwtTaco6IpQEIjWXJikEstTCOvjvbM5gBpkYfwlRN
	PZ6xMPB2o9robw4XCikyZr/xtBx/E5nBmbBOkMdxQrzCT1K57awFsTyHzUah65k3je/24zxZw8b6E
	VYiZi2073Qm5ftAfYwsKusPU+L5E156q+s2F1U/Xfa+6AzK6oPnSx/6py4W0pT8ulADsMYC7iT6wG
	hShs0OvQbAZ3d7qYlywFRMDOQmzYiG6dYDnuX030aNU1Qtqi2oRgYxpwE5QDIFCdOMd730N7n3XBy
	imRNEFeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymtW-00000000QYG-0mCb;
	Tue, 25 Aug 2026 08:52:34 +0000
Received: from out-175.mta0.migadu.com ([2001:41d0:1004:224b::af] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymtT-00000000QWw-2Gsa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 08:52:33 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=MJRz9UsvtPUogXEuUq018MMm0hDrqct732z/+RmQUpg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787647949; v=1; x=1788252749;
 b=jo60lX3CW8pdd9FAr8SHW2Idr2ZBedlbIHOF8C14KvAyiJ4cjDOhh2RMge3LS2gFDbc7XmLW
 prsoh04wjjWY51ai4RuNshQUclv2z7o/pn5BBNyn6g/IMOZz8kaDqs51A+0ypcUwaHl3L9nXBM4
 CVJReZ6iiwMSVHo4BghgBkKE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from mail-lf1-f51.google.com (209.85.167.51)
	by smtp.migadu.com with ESMTPS id 55718f58b78cabbf;
	Tue, 25 Aug 2026 08:52:29 +0000
X-Mizu-Trace-ID: 55718f58b78cabbf
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b2a8173142so770e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 01:52:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoxdsliaB9uWSpQPPX657u7CgiUY90UDMabxcARUFJ9I2XrPzFDMLMeklJNEN1P8ALuKKwAT4iBaCpMRcVkseVC@lists.infradead.org
X-Gm-Message-State: AFuF++nnmsn+D/piyBQceZvlhJn/4GX9wNpbWpF49aJOYxXcBVChtd7y
	/tZQHPM0G5JdY154Bnojnv+bbtb+Ldj39kN1bYRma9TB3urqJABdc2G/eOl4iywaW9BorFsbeQx
	8UNQLe8UKcfuqkLtKtax5cfJaORuhQuT3PzZzlvzj
X-Received: by 2002:a05:6512:10ce:b0:5b2:a5e9:3aba with SMTP id
 2adb3069b0e04-5b49de6a580mr52428e87.6.1787647944151; Tue, 25 Aug 2026
 01:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260731143541.956291-1-vdonnefort@google.com>
 <20260731143541.956291-7-vdonnefort@google.com> <yq5afr02wstl.fsf@kernel.org> <ao1OAx_zLwpaw_5Y@google.com>
In-Reply-To: <ao1OAx_zLwpaw_5Y@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 25 Aug 2026 09:51:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwX+yNayXYD_22vKazzT-yv-9D8Tt_qH0hgPn0-M3kiWA@mail.gmail.com>
X-Gm-Features: AcwNN1U9f1FmJy0X5evuVUC4pyUr9OdSe9hRSm1gkswTc6pqY7URUvwVVrwZ7JA
Message-ID: <CA+EHjTwX+yNayXYD_22vKazzT-yv-9D8Tt_qH0hgPn0-M3kiWA@mail.gmail.com>
Subject: Re: [PATCH v4 06/17] KVM: arm64: Add pkvm_hyp_req infrastructure
To: Vincent Donnefort <vdonnefort@google.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, maz@kernel.org, oupton@kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_015231_782395_4D893510 
X-CRM114-Status: GOOD (  13.45  )
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

Hi Anseesh,

On Tue, 25 Aug 2026 at 09:10, Vincent Donnefort <vdonnefort@google.com> wrote:
...
> > The SRO model covers more details than the pkvm_hyp_req infrastructure.
> > Should we look at making the two more similar?

Thanks for the pointer.

Where I'd expect CCA and pKVM to converge is how confidential
computing platforms are abstracted to the rest of the kernel, and that
already happens: arm-cca-guest and pkvm-guest sit side by side. The
host to hypervisor path seems like a different question to me.

Cheers,
/fuad


> >
> > -aneesh
>
> Hum, this is really just a few lines of code. Also, pKVM doesn't need a stable
> ABI with the kernel. Implementing a portion of a spec here sounds way too
> complicated for that simple usage IMO. I struggle to see in what way this would
> make pKVM better.
>
> --
> Vincent

