Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99337F513EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 02:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQzhNc04McOCTp4ZWH0zZtCOyhhtw3rBPEi5ryyYZDs=; b=eclXmFWOS1SMwOR1q6IohAXLDD
	1sBNuGDySySxNke4gsGrX1yrmc3QmQvLWsAVzpJLysumoG57OFpZ2nZyHhmhC1zqZgoryDVlnpFvJ
	6hukJNh8+dM2F/+WYYGktyEN8tHZlC1UEIndATRfVwGoIL8rms8o7xKLfGh8terEs/KOacEX9GLEG
	pQVN4P60iB2KrINljPO7tOCa0swb0d/cwupP9w5Mc83bHk+CyNAT+Fq4qXfrImpCmpvwAXIGREJYb
	+BhIEMGbdCBIaDZld84aZXZycCVYWjjIJY6OgzrUGky1+zjm5D8ecfJCTbObU3C49ua1NWjet+EAc
	2SSvHX4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyKjI-00000002s08-0L97;
	Fri, 06 Mar 2026 02:15:52 +0000
Received: from 011.lax.mailroute.net ([199.89.1.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyKjF-00000002rzk-3Wib;
	Fri, 06 Mar 2026 02:15:51 +0000
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4fRqkq3gjdz1XLyhj;
	Fri,  6 Mar 2026 02:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1772763341; x=1775355342; bh=QQzhNc04McOCTp4ZWH0zZtCO
	yhhtw3rBPEi5ryyYZDs=; b=JVocAbDcPCawaLdZUbGJ/JA5LZXFqCklWhrTCayZ
	+PFOMpYsRetddtYRypn1ESePaMZTi6OD+Z1i7/xXGEzOBZxYwfWsAmsaj5CGwgRY
	xhnTN37ra7EojpmRd5/rhEXtFSSIqw35jTrvhFtZwHIXmhf5MvhYZqldLW45B6n5
	/ommnXVv+teANBYAKlJh79scM91RgXGVAwuNegFiAuoIhfJMD02uTPocuOAsDvqe
	Msoqjo8A7nHcIu1CM4UAaSM4Dmd+LzYxgOxCc/yUe8a+BJO50HArwpMuVl5a/OZN
	q3/Aiwori8z5C7rpzcHsEk3C5syk0Uc+rfUfqSGQEjF0BQ==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id XSnpNyjx8kaO; Fri,  6 Mar 2026 02:15:41 +0000 (UTC)
Received: from [192.168.132.187] (unknown [12.150.89.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4fRqkf112nz1XLyhh;
	Fri,  6 Mar 2026 02:15:37 +0000 (UTC)
Message-ID: <0c793e57-ee29-4322-8cf9-0a4a859b9981@acm.org>
Date: Thu, 5 Mar 2026 20:15:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ufs: core: Add quriks for VCC ramp-up delay
To: =?UTF-8?B?RWQgVHNhaSAo6JSh5a6X6LuSKQ==?= <Ed.Tsai@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@HansenPartnership.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
References: <20260305083610.2672344-1-ed.tsai@mediatek.com>
 <20260305083610.2672344-2-ed.tsai@mediatek.com>
 <fd1fb573-6d02-433e-a74a-1a015c64e3be@acm.org>
 <0e812b2b96603f69467b57ae6e9836ef8b4bd1ff.camel@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <0e812b2b96603f69467b57ae6e9836ef8b4bd1ff.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_181549_945290_B937B006 
X-CRM114-Status: GOOD (  10.30  )
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

On 3/5/26 6:19 PM, Ed Tsai (=E8=94=A1=E5=AE=97=E8=BB=92) wrote:
> On Thu, 2026-03-05 at 06:24 -0600, Bart Van Assche wrote:
>> On 3/5/26 2:29 AM, ed.tsai@mediatek.com=C2=A0wrote:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * On platforms with a slow VCC ramp-u=
p, a delay is needed
>>> after
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * turning on VCC to ensure the voltag=
e is stable before the
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * reference clock is enabled.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (hba->quirks & UFSHCD_QUIRK_VCC_ON_DELAY=
 && !ret && vcc_on
>>> &&
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hba->vreg_info.vcc =
&& !hba->vreg_info.vcc->always_on)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 usleep_range(1000, 1100);
>>
>> Since the value of the delay is platform-dependent, has it been
>> considered to introduce a new vendor operation (vop)?
>
> A vop does feel a bit heavyweight for a simple sleep. How about we add
> a new configurable variable, similar to the approach used for the VCC
> off delay?

Let's postpone introducing such a configuration variable until there is
a real need for such a configuration variable.

Bart.

