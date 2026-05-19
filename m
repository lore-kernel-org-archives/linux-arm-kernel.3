Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A010CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 05:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5UKwXDW+7hb58mPBed45GUx0hIJvFOx7kJoYQzf+VD4=; b=sTKZsFFTAZBi0y5LIx/MGybIw8
	ZC1DWXaGUGstfms+MIb4LLwiCorbmP9rmo7ZDaB7SrECmx+GkKF14Y2P9XbnhdwDKbepyKmIKQyhm
	060dCwnwfV1MICchIxki5PvcFR7o+diAp3wDHeBHY/f+/f5q/XtueIRjStulAaMKeMXUKJlvhUtvB
	0VOZDVeLfqPhPzaCehUkVMSrh/ij+S7e9qzuww5UZy0UIKhMdwOSZu/x4EppH1SWmErXdabz6DUfy
	4dYYrsZ8SrnMx9Bvjogoixwd97a3SM3cn+m5OJ3s0khS10fW9/FWqxFjWDv7Ai8KJrQqXV/Vd8Uv6
	U0uQmtnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPD7A-00000000Cxw-11mO;
	Tue, 19 May 2026 05:35:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPD78-00000000CxX-0OOK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 05:35:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 67EB1405BD;
	Tue, 19 May 2026 05:35:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1908FC2BCB3;
	Tue, 19 May 2026 05:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779168933;
	bh=rP9RzIPHI8dCnBjHtIv/y8xFe4w0kc8tSuhI6pYZh4E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TmPhvEP+EV1rsncpjT3wPHyPBm6X0H7DE38LSE7TRfUiD5uiNuDbbf7Z6GIY/J732
	 tZYU5Zrf3nKGmTdXvGkjcZcmPIRzURLUPo5iW/o3kWpNhrz9Imr6pqGQqKH02OT5bi
	 GV94tpcX+G0ea47kVAEDqwuSbgGGThL2N9O02eY+CkNRCbfXyGSJx3JJdyZRcz8VQC
	 8BFrVXYCoeDYNgFTJtGTOr37P/2r7jd7JI6DvO8qdQ2liiPnOwnZZpdLRaZhUmvu71
	 bfbViwK+gz3rGm/kdTYVhKjKbSvqEvHnnUwjhnXGua5wLHunAkaiJn8z2X35XQP2pF
	 G0npnvxEopUSw==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
	Lorenzo.Pieralisi2@arm.com
Subject: Re: [PATCH v14 05/44] arm64: RMI: Add wrappers for RMI calls
In-Reply-To: <20260513131757.116630-6-steven.price@arm.com>
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-6-steven.price@arm.com>
Date: Tue, 19 May 2026 11:05:22 +0530
Message-ID: <yq5aecj8t10l.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_223534_152714_F9B8CDE0 
X-CRM114-Status: UNSURE (   9.17  )
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

Steven Price <steven.price@arm.com> writes:

> The wrappers make the call sites easier to read and deal with the
> boiler plate of handling the error codes from the RMM.
>
> Signed-off-by: Steven Price <steven.price@arm.com>
> +#define rmi_smccc(...) do {						\
> +	arm_smccc_1_1_invoke(__VA_ARGS__);				\
> +} while (RMI_RETURN_STATUS(res.a0) == RMI_BUSY ||			\
> +	 RMI_RETURN_STATUS(res.a0) == RMI_BLOCKED)
> +

I guess this is not used. Also, that would require the call site to have a struct arm_smccc_res res.


-aneesh

