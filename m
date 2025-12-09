Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526A8D1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 09:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vKvhbBj92/QPwk0Jc3NX9v7/0BjdeDe2DFhKcDpoywI=; b=LAXvOkxlrblN182IrxHzTbXJjG
	y0cInXLziX/1N8X6TgsqIOI89TJDJ7F2euh5eCBo3uo8EA9DA2t5z4/hydec/ilZg5203wSL9y/EK
	KrHNWVrok+zl3fnZYjSJZOF+lleYtzsPl63pCuPIfYtFaYCRcZWeTeMSu02l+oicVckb3ilZk90gZ
	9XJYpb2FgUn2/xK5iCKvp7+wXY0eWWS/rN5rsjk94QRGkylIGB62uVeMyoU8QBEPgbJ9/Eo+KrDX7
	Xa5wXKlgCu8VlVt0tOk7upHf+vER2WdW5onNfJQ84WHyEA3T2urRXWJ147bCw9ExaTJVzgFEcbr6Q
	OUQhBVjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSu3y-0000000E2nE-4C2e;
	Tue, 09 Dec 2025 09:31:19 +0000
Received: from mail-m155110.qiye.163.com ([101.71.155.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSu3v-0000000E2mO-3nSc;
	Tue, 09 Dec 2025 09:31:17 +0000
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2c8cc602d;
	Tue, 9 Dec 2025 17:31:03 +0800 (GMT+08:00)
Message-ID: <75166475-d6a8-45b8-8092-f31d292d4206@rock-chips.com>
Date: Tue, 9 Dec 2025 17:31:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Issues with DRM_ACCEL_ROCKET (Oops, power-domain, probe-ordering)
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <0b20d760-ad4f-41c0-b733-39db10d6cc41@cherry.de>
 <77685900-2c34-49b8-8c7e-14718841ef17@rock-chips.com>
 <fa82d11f-ce11-4feb-bdb4-c31d360a2a62@rock-chips.com>
 <CAAObsKDYLXVf1GdYUNeaOya+pWD4jTOEf55ouXAL9iM_kWCcMw@mail.gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <CAAObsKDYLXVf1GdYUNeaOya+pWD4jTOEf55ouXAL9iM_kWCcMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b027335b403abkunm41f438e635d96c8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkxKT1ZDTkNLQ0seTkxKGUJWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUJCSU5LVU
	pLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=hiq+HVmS9ouBOLn5EdNKviGgYRYZJB/DNQU9P+jo5nnuhLcGwb7VK051dApOrw1EwxmRKa22tJkf88lu4fr8Q7ioJAYxel45NfV/+6phYFrPS2oyFpWn0cnJFnCdakabtFAI+0ptoEgdywXNiU5S1Fb/Kh+dii8zMDZjsr/GvLg=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=vKvhbBj92/QPwk0Jc3NX9v7/0BjdeDe2DFhKcDpoywI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_013116_112945_936779B3 
X-CRM114-Status: GOOD (  12.49  )
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

Hello Tomeu,

On 12/9/2025 2:55 PM, Tomeu Vizoso wrote:
> On Tue, Dec 2, 2025 at 8:00 AM Chaoyi Chen <chaoyi.chen@rock-chips.com> wrote:

[...]

> 
> This need was questioned during the review process, and during my
> stress testing I didn't find a need for core 0 to be treated
> specially. So it was considered unneeded complexity and the code was
> dropped.
>

Oh, I just noticed that the commit comment in the devicetree still
contains a relevant description.

> My testing involves running the supported models as a whole, and also
> their individual operations as individual tests. I run them in 8
> parallel processes, in batches so we have continuous bring up and down
> of clients.
> 
> I'm a bit surprised that that testing worked stably but we have still
> failures in some setups.

Could you please describe the failures that still exist? Thank you.

-- 
Best, 
Chaoyi

