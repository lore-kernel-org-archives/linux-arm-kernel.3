Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82A9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7uGc6qOcbWaZba6BNWE0w8BupLDIVpLKSnAAYXy5/LA=; b=o/jPWKxkFhMOIr0qHh3Tv2w0Q9
	Tgx2aeqhyEHV97i9a3YYn1yzNlOd58zIBgLN1iIKG3O4ptT9PSuvkTC6iPWuo8MzmvUwbPYfDHpm3
	F/4NhZKwElWpvBGSTOHa/bz5U+jThZsky9/cRyj3H1/TI2QANM+fhOhr91YmMn0fv5m4sxmnuAhEF
	VbsHEhQbivJ5gwlCokjeYXpRg2MFAG4OWPuIfBT5VtPUeHp7Iw6oraR/r9CIkqHx4MrwNR/Choymt
	quCRvdEFSpjCMRUdvINaDSbF7d+dVkSwXtU5QhEpFNfGTFDa+MXYzXkFJdiZwAleLCy8O50Tjraxh
	VLpg+1Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkwN-0000000CqTc-3dtt;
	Mon, 06 Jul 2026 15:08:59 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkwL-0000000CqSx-1H9v;
	Mon, 06 Jul 2026 15:08:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783350530; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KPsfhiRXCf62s1OD5a77dlrT765LM4geTQwnspwwaF9iA/UClFJYyjZUR4d3iN/yC6N2YWJRetoZuZE8jlBLA7N094NXjiAbQhoNzY0YflKhrKmEBhCAjL8yWZpCgRjFSoMrCapRg26glxeeXxgWPXSIn2PPSz5Uj3qjO2qzYnc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783350530; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7uGc6qOcbWaZba6BNWE0w8BupLDIVpLKSnAAYXy5/LA=; 
	b=jQGUTSXzm8Mz6Xjfgj9ThaozJ27mZRqyH6el57aksBAjvwtN8IIXkXd1MrtGY4+l5iLjw3siFb+ydDfXTMXXt/f0T7FOqN2Wqr/D9Q1zir5TAOocBimrfMx4nbyEjkIkrvFHwaVAD9mNNx7kvkfU3gDtgClNmbWVbECcRv3hDLc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783350530;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=7uGc6qOcbWaZba6BNWE0w8BupLDIVpLKSnAAYXy5/LA=;
	b=q3eQUZ0IqazpyaqParrDoAt0z0vmwXbsUOt4onTMMj6Nz4XaPBzoBWotFlgj3u5k
	qqWOzGVVOys8PF+9feZuAG73he9MsoxJKSIvtPjqNpYfnVbbZ7TxfHfBloIQsU7Q2BT
	lazx5YDOFKqXDLxtdjJzna5ZnoTtS3q90/iAtcf4goTXwUKUj4MS2uWLsswNXJg3+YO
	2yyu/R4QwqZcYD7iuP4QrpnQxXBI99yY1VCSSnm7hE2FP6PlRs+j3HiHJ9Mki0c1eAs
	vh2XGViNiGsIzurkI8O3MR2Vd9pqXfn9TYDU1JDZxYTcZC194hJbNRAL6tdu925HPGG
	tB/6zmwXHA==
Received: by mx.zohomail.com with SMTPS id 1783350527830956.3838171300544;
	Mon, 6 Jul 2026 08:08:47 -0700 (PDT)
Date: Mon, 06 Jul 2026 23:08:36 +0800
From: Rong Zhang <i@rong.moe>
To: Rafael Passos <rafael@rcpassos.me>, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
 =?UTF-8?B?Q2hyaXMgTHUgKOmZuOeomuazkyk=?= <Chris.Lu@mediatek.com>,
 =?UTF-8?B?V2lsbC1DWSBMZWUgKOadjuaUv+epjik=?= <Will-CY.Lee@mediatek.com>,
 =?UTF-8?B?U1MgV3UgKOW3q+aGsuasoyk=?= <ss.wu@mediatek.com>,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_Bluetooth=3A_Properly_disable_rem?=
 =?US-ASCII?Q?ote_wakeup_for_MT7922/MT7925_on_Ryzen_platform?=
User-Agent: Thunderbird for Android
In-Reply-To: <DJRKO72HWZOI.QJYJUAC45QOJ@rcpassos.me>
References: <20260701-btmtk-ryzen-remote-wakeup-v2-1-767ac7907472@rong.moe> <DJRKO72HWZOI.QJYJUAC45QOJ@rcpassos.me>
Message-ID: <79D5F3E6-8F40-4422-BB2D-16691E377394@rong.moe>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_080857_405216_1353F4AC 
X-CRM114-Status: UNSURE (   7.35  )
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

Hi Rafael,=20

=E4=BA=8E 2026=E5=B9=B47=E6=9C=886=E6=97=A5 GMT+08:00 22:53:17=EF=BC=8CRaf=
ael Passos <rafael@rcpassos=2Eme> =E5=86=99=E9=81=93=EF=BC=9A
>I was having issues with Bluetooth on the ASRock B850M with MT7925=2E
>I tested this and other patches in my investigation process=2E
>My issue was a platform bug causing a failure in USB enumeration
>before the driver path (unrelated to the patch)=2E
>
>I can confirm this patch does not introduce regressions on this platform=
=2E
>I tested system power cycling and suspension,
>and also BT/Wifi adapter enable/disable=2E
>Patch applied on top of mailine (7=2E2 rc1)=2E
>
>Tested-by: Rafael Passos <rafael@rcpassos=2Eme>

Thanks a lot for your testing!

Your issue sounds related to the remote wakeup issue I am addressing=2E Af=
ter triggering the remote wakeup bug, rebooting the platform without a powe=
r cycle [1] always causes a failure in USB enumeration before the driver pa=
th=2E

[1]: power off, unplug AC, wait for a while, plug AC, power on=2E

Thanks,
Rong

>
>Thanks,
>Rafael Passos

