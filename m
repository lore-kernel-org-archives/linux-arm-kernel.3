Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C29DC8302F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 22:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfXdfCU1JXYHWgM00Dwc4NWjntBjNe637EIYzIR8E9M=; b=YWBHc0YHXKJLXPDS+Z2Mp0UjSq
	b1+vvw+COxf1/8ftBLQtL8B+aMZxOKN8hsER6RyhyD+B5ChhM8lm/MPvceIzpfM3e5LlZuOikJ1qu
	YZ3qm3Zw7EIT5lB5IN9atv1h/s7JwHnBkY0lmEP3+ZidbwFM0aRK8hcBPIRUHmwYzDZJYaLmxoFCd
	VM+GfMB2tu0IzC/J01ZMJ4dwdLoVjwgpTSLBVPV4wfnaRXu8CFh9camJqah7PO+BuaeJ1VvrNDG2U
	JQiNKj4eckhsvgEqOPRWifHQVU9qhLN36ZMAyQdikjhW7sKgkaxTqT5b1IZS/OufSLnI4YUp+RWhr
	T74LLObQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWMwv-00000003an7-0zQE;
	Mon, 30 Jun 2025 22:26:05 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWMua-00000003aSv-1i92;
	Mon, 30 Jun 2025 22:23:41 +0000
Received: from [100.65.217.140] (unknown [20.236.10.206])
	by linux.microsoft.com (Postfix) with ESMTPSA id 600CF201A4B1;
	Mon, 30 Jun 2025 15:23:37 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 600CF201A4B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1751322218;
	bh=DfXdfCU1JXYHWgM00Dwc4NWjntBjNe637EIYzIR8E9M=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=AcgUP7F5Xs4efIzQ5AVmdKa7P852sKqoOBD9OFtayslYiPtUbgrNCaPsB5x3Gld0L
	 LP1XW6CcFe5MMWGw+TQYVQ9v4jHISvIhVkeCZpleKKdszGvQhRpLVlunF5jrreMfri
	 Oz/KtwqHFyjwVxxQTH3wGx+4JaIlZHQAou0j86rs=
Message-ID: <44e48ee7-07a8-4bbc-a98b-095bb1d585a0@linux.microsoft.com>
Date: Mon, 30 Jun 2025 15:23:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Subject: Re: [PATCH] Input: mtk-pmic-keys: Fix null pointer dereference when
 no compatible data
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <20250630-mtk-pmic-keys-fix-crash-v1-1-e47351fa9d1f@collabora.com>
 <41f3cc74-694e-41be-b767-20c7561990b8@linux.microsoft.com>
 <667whxdsghpao5irl66oh66l5y55m4k6n3ztifaizbqtrzccju@cmghlz2yauxq>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <667whxdsghpao5irl66oh66l5y55m4k6n3ztifaizbqtrzccju@cmghlz2yauxq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_152340_477770_49DBA2BC 
X-CRM114-Status: GOOD (  10.96  )
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

On 6/30/2025 2:46 PM, Dmitry Torokhov wrote:
> On Mon, Jun 30, 2025 at 01:18:40PM -0700, Easwar Hariharan wrote:
>>
>> Also, it may make sense to CC: stable@vger.kernel.org for backports
> 
> What for? Stable does not need a patch papering over an oops, it needs a
> patch making the keypad working on the affected device.
> 
> Thanks.
> 

I don't have a stake either way, it was simply a suggestion, since it qualifies
IMHO, per https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html,
the patch "...fixes a problem like an oops..."

The proper fix might well be, as Nicolas suggested, adding the required compatibles.

- Easwar (he/him)

