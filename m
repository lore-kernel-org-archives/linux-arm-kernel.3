Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37301C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 16:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJWiZIM9t6hCE1uumiX5l0IHS1cRZpJdK7FC7mUHd60=; b=GLbHuSIOpdK16ymYuj+K+ihPBN
	SzibMUahhyQ1VU8FHm5wl+frGAG1z0WxLDtklEntBgaOWFHgcZTgdXD/uPfAtg/B1TQhaFlv+EijG
	RMpomuCJ9eesH0oP6xJGAWgoAQd5SqyRmwkCNlo7cwXFOtluRXGBcjs0LczKKfVwpt/GCWqAoxidE
	mtPw8KDT25ZHYtqdVCPcyFnk4YDDRkWWVDf8PdA52CN1LM8zyCnqNvlMf8Q6syoT/0SvFrkG5cYyK
	DFoAiPT03lRmk/o24g2b11lawoyoe4YtMSxmGwS0dHTyQytnsL3t2Icu4hbzTjYXpN1H/OpX4WgJM
	v3jFi4Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNDvf-0000000G5i0-14JW;
	Thu, 05 Jun 2025 16:58:59 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNDnv-0000000G4jO-0wQ2;
	Thu, 05 Jun 2025 16:51:00 +0000
Received: from engine.ppe-hosted.com (unknown [10.110.48.11])
	by dispatch1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 21E4060131;
	Thu,  5 Jun 2025 16:50:58 +0000 (UTC)
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id EAF509C00B0;
	Thu,  5 Jun 2025 16:50:55 +0000 (UTC)
Received: from [192.168.100.159] (unknown [50.251.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id 3F18C13C2B0;
	Thu,  5 Jun 2025 09:50:55 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 3F18C13C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1749142255;
	bh=KKU7JGwV630uYHk6oyMArrGMBq6T30H84Y9tnAFAvKw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k5QS/hwpRfikGil4LjTvurxBGdjCrV4JEMC9nrpUGxiuATFcHAqyMRzxoSfAsowpY
	 Q2ltuMgyEKXz3BJ7Y9ukhK+r8oxb1HfTMG9vl/Tr1NmAfFxxAEDMrGFA66ZYkLcFGs
	 Zj217yiVs0I+uJE8ObcgjquzKcZ2YQT81tDH9Or8=
Message-ID: <909d2ca8-8409-997a-768f-8e9be4c5168e@candelatech.com>
Date: Thu, 5 Jun 2025 09:50:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH mt76 5/5] wifi: mt76: Remove RCU section in
 mt7996_mac_sta_rc_work()
Content-Language: en-US
To: Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bo Jiao <Bo.Jiao@mediatek.com>, Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250605-mt7996-sleep-while-atomic-v1-0-d46d15f9203c@kernel.org>
 <20250605-mt7996-sleep-while-atomic-v1-5-d46d15f9203c@kernel.org>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <20250605-mt7996-sleep-while-atomic-v1-5-d46d15f9203c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1749142257-XPExwF6mYgA3
X-PPE-STACK: {"stack":"us5"}
X-MDID-O: us5;at1;1749142257;XPExwF6mYgA3;<greearb@candelatech.com>;cd09869c97ce2e719a3744df88686fd8
X-PPE-TRUSTED: V=1;DIR=OUT;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_095059_342999_A2156E8D 
X-CRM114-Status: GOOD (  12.20  )
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

On 6/5/25 04:14, Lorenzo Bianconi wrote:
> Since mt7996_mcu_add_rate_ctrl() and mt7996_mcu_set_fixed_field() can't
> run in atomic context, move RCU critical section in
> mt7996_mcu_add_rate_ctrl() and mt7996_mcu_set_fixed_field(). This patch
> fixes a 'sleep while atomic' issue in mt7996_mac_sta_rc_work().
> 
> Fixes: 0762bdd30279 ("wifi: mt76: mt7996: rework mt7996_mac_sta_rc_work to support MLO")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Thanks for the quick fix on this, it appears to solve the problems we
saw related to this.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com



