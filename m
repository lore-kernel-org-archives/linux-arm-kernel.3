Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5D4C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 13:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1TSR0s1wHZNE3+Ic3FeFngAmbTQVzx7yaIp2C4u0jWQ=; b=nm9EHaXf+L8d3vlO827SZdidcx
	DMst21TivshMbUgdTijK1dxK8KctxZ2Eb23Mil7tvP34uRabxUAG+Tx7PNCogwl7QHkuTB1BxRNWB
	VRXG8XwOE34Wods4Kii5j9bb21L4+mrIEMYL/n06kgC0ywPvo2x/nDDmlaDT6FzhHhMpU67lChRhN
	727q2t/1pygYHHW39ku/uLAGdI+vbZao5Q0HTs1ibjGnaMVl3MF9KGL7mCM8f+AiRyXMh1JRS9/Ig
	PNzIbOD2EYOc+lRDCF5Q8lVwrNREM/nSAmEYCENoMbkklrhzf0PjJFiSoTMyjaSV2foxLxqQNMDe1
	+b++xBhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrCn-00000000rbS-348F;
	Tue, 25 Aug 2026 13:28:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrCl-00000000rb8-2mW2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 13:28:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C00286011F;
	Tue, 25 Aug 2026 13:28:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DCF31F000E9;
	Tue, 25 Aug 2026 13:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787664522;
	bh=1TSR0s1wHZNE3+Ic3FeFngAmbTQVzx7yaIp2C4u0jWQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=P3ZyNTw3H3W515BogR9jOcksj2kkfQI0mUMT2R+G+n1ImdayXNXiX419jhmtXi750
	 O8922T8IGM7ruGrS+8h0kfRAVjGjtiUQLXWaoecdcYI4qUOb0pzMRTIXIxMik7l9Kb
	 qr1dsY84x3EF0K7wXWENLAxmoDAeH365czUnuff5n1ub3vRBiNZFBYVvSlwk6CR24v
	 2YpXfM/s6n9/Po9GYyKsjxzbpwT+8Vsl6cQoY7PPp28lLOXgoClAPX40foeG81TdbH
	 y/Rl9ATkDqHllrl77OEiLZHU+Kbn6IPCmNk407giAWqeCTW6XL3y0+4llR/sjbfQRC
	 tVEU/3eiF3YtQ==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	kernel-team@android.com, fuad.tabba@linux.dev,
	qperret@google.com
Subject: Re: [PATCH v4 06/17] KVM: arm64: Add pkvm_hyp_req infrastructure
In-Reply-To: <ao1OAx_zLwpaw_5Y@google.com>
References: <20260731143541.956291-1-vdonnefort@google.com>
 <20260731143541.956291-7-vdonnefort@google.com>
 <yq5afr02wstl.fsf@kernel.org> <ao1OAx_zLwpaw_5Y@google.com>
Date: Tue, 25 Aug 2026 18:58:31 +0530
Message-ID: <yq5a5x0yjpmo.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Vincent Donnefort <vdonnefort@google.com> writes:

> On Tue, Aug 25, 2026 at 01:11:10PM +0530, Aneesh Kumar K.V wrote:
>> Vincent Donnefort <vdonnefort@google.com> writes:
>> 
>> > Introduce a struct pkvm_hyp_req to enable the pKVM hypervisor to request
>> > resources from the host.
>> >
>> > Provide serialisation helpers to transport these requests via SMCCC
>> > registers (starting from a2):
>> >
>> >   pkvm_hyp_req_to_smccc() to encode into the SMCCC args.
>> >   smccc_to_pkvm_hyp_req() to decode them.
>> >
>> > When the hypervisor raises a request, the host must handle it and retry
>> > the HVC. To automate this sequence, introduce the pkvm_call_hyp_req()
>> > macro. This intercepts pending requests, invokes the handler and retries
>> > the HVC.
>> >
>> > Additionally, introduce a trace event to track the handling of these
>> > requests.
>> >
>> > Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
>> > Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
>> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
>> 
>> 
>> This is very similar to the memory-transferring SRO operations described
>> in section B4.3, RMI operations, of https://support.arm.com/documentation/den0137/2-0bet3/
>> 
>> The SRO model covers more details than the pkvm_hyp_req infrastructure.
>> Should we look at making the two more similar?
>> 
>> -aneesh
>
> Hum, this is really just a few lines of code. Also, pKVM doesn't need a stable
> ABI with the kernel. Implementing a portion of a spec here sounds way too
> complicated for that simple usage IMO. I struggle to see in what way this would
> make pKVM better.
>

My goal was mainly to see whether we could keep a similar design pattern
for the hypervisor requesting additional memory from the host. I wasn't
suggesting that CCA and pKVM should use the same helpers or code paths.

I was thinking this might be relatively easy to do on the pKVM side,
given that there is no strict ABI between the host and hypervisor. The
benefit would mostly be in keeping the design patterns similar: how an
incomplete hypercall is indicated, which registers are used for that,
and how additional memory is requested.

If aligning those patterns requires more work than the benefit it
provides, we can ignore this.

-aneesh


