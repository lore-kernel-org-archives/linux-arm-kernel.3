Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF27C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 16:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3oNfu1Kk8lwcsuRc6AdBu0ZTa3qawlKPCReGrf7HMQ=; b=BOaau7mksik3Y0XZzb1STRtTT0
	IFQVmVvA6OT+y8baTF8BwGUzhbZqGVL+WPJp1BN+dBjyC2G1K5gyInM5zS6SyHQym9fYB5aelYl9a
	UGr8eBeiGEYE+ZG1uvbUOGbOFQuQF04F68LMkcbtZkK6yBNTiq9GnYfnUEj3LKsjT2WSU5MClm8uA
	fo0dLjpZZrSwt/61EWCbqNf41Oaj+LhS/fsN7TxSUzNi3SzWSpd5uimwlT9gVzHR/fj99vwRD6dZz
	BGTavPE62bbBJnnp+jPCXcFIRre45IGTKzZ/VcSNYEm92qnXBQ1nkhtYxTdVW5+Fq0dT38N8rAFyq
	eFdNH58g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYozv-00000000ke4-14IG;
	Fri, 17 Jan 2025 16:15:03 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYoxo-00000000k8v-3dv3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 16:12:54 +0000
Message-ID: <28f44815-355d-49cc-aed3-8383320b2d72@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737130370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I3oNfu1Kk8lwcsuRc6AdBu0ZTa3qawlKPCReGrf7HMQ=;
	b=A4Bc9BkC4qEo2VQEi3EzBWQBn1yuj9AByeeoq7swNdbnCzWR1Iuf4OXtsT8u8C8ZwJINXV
	hEuKQJp4axaYbA1DSl7zvAcWfKvlyjxli88T7GcnjmxDhG06CDZYW0IiUUmsxdbCSEsKQb
	5FSbxasVb++TWGhew5W+hi1zgCNHchE=
Date: Fri, 17 Jan 2025 11:12:44 -0500
MIME-Version: 1.0
Subject: Re: [PATCH 4/5] spi: zynqmp-gqspi: Allow interrupting operations
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, Michal Simek <michal.simek@amd.com>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
References: <20250116225521.2688224-1-sean.anderson@linux.dev>
 <20250116225521.2688224-5-sean.anderson@linux.dev>
 <87y0z9j0ha.fsf@bootlin.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <87y0z9j0ha.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_081253_068912_B16214F8 
X-CRM114-Status: GOOD (  14.12  )
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

On 1/17/25 03:41, Miquel Raynal wrote:
> Hello Sean,
> 
> On 16/01/2025 at 17:55:20 -05, Sean Anderson <sean.anderson@linux.dev> wrote:
> 
>> Some operations (such as reading several megabytes of data from a flash)
>> can take several seconds or more. Users may want to cancel such
>> operations. Allow them to do so now that we have a way to recover.
> 
> I fully agree with the observation, I tried myself interrupting too long
> transfers with another spi controller:
> 
> e0205d6203c2c ("spi: atmel: Prevent false timeouts on long transfers")
> 
> But there were issues reported, so we limited the signals to SIGKILLs:
> 
> 1ca2761a77349 ("spi: atmel: Do not cancel a transfer upon any signal")
> 
> But jffs2 plays with sigkills, so for spi memories it does not work
> well, we had to revert:
> 
> 890188d2d7e4a ("spi: atmel: Prevent spi transfers from being killed")
> 
> Same thing was also observed on Zynq7000:
> 
> 26cfc0dbe43aa ("spi: spi-zynq-qspi: use wait_for_completion_timeout to make zynq_qspi_exec_mem_op not interruptible")
> 
> I would however hint to use a specific helper for deriving your timeouts
> if you play with spi memories, because it is interesting to adapt the
> values nevertheless:
> 
> d8e4ebf870187 ("spi: Create a helper to derive adaptive timeouts")

Hm, ok. I wasn't sure whether this was allowed, but I saw a lot of
interruptable users under drivers/spi.

I guess I'll drop this patch for v2.

--Sean

