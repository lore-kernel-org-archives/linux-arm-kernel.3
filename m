Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA75E9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 11:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QpMhItSqWDmZWN3CyWehgL8eDC1MQIfcD9XdymF+1A8=; b=aLTOdWP2754IdviUcZBfvboTHX
	KF/SO3jGPJAtbA0H7H3Y7f933bhtz7oEp6qHfyTkWA91K2J6aLpPkjxmGyHOv+tswBPEP1+fTh63l
	mfrNek8bi8peEzKH7gbHYMvkFOsRMPqu6qh5vPhZOgw0t7mV/OOE3q6H+oVcu5LS3Q6GJzZ4+aTv6
	z6pv6IGL6hRUrmaFbTFbOmNCnxdRTs2c6OQcSMaO/JNQaX+KarhGb1erreBox+VgnyWfDtm6jT4AQ
	aeM6ts0RC+MP7TUk9hMGB0t5MxI6kHqpjoEn0cxrJ0K9j56/h6ikFvLxWfUV9xks6o8YJia1kOLkZ
	GYknhRbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt2LX-0000000BIH0-0KdM;
	Thu, 19 Feb 2026 11:37:27 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt2LT-0000000BIFT-3j1e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 11:37:25 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-48371bb515eso11303965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 03:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771501041; x=1772105841; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QpMhItSqWDmZWN3CyWehgL8eDC1MQIfcD9XdymF+1A8=;
        b=TrLZpkZ4msrhUqymvT4tb68G3iKFhTNg5Fpe8UteawsTZ7KqPHwo+M8RXkZDgY04j2
         cm7dJraBBbG+qmHTwpZ72DHgxaCcnEuxbi5ohk9iP6+TINoHMK5XjtdIzr6b/HNz71Yh
         3BmHPg1r6vTfrQVIhe9t7qOpGiG01y5fhcSCBgN62P69Nvgb4W9RK5h1gLrAQEePW6gQ
         ZxwuPKsadZ2aO+HFxalmHFoWbSAIfOiDUCDKNuY9lAuZQ7dSp4VJpDwiwQxfSroRPPnT
         guCVWNRhIlLkoe7Z58FxpV1YHFpeF9ZaphKspze5GkQ1B6aSG1wRr0Lf8KsuTxScIsCe
         7GWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771501041; x=1772105841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpMhItSqWDmZWN3CyWehgL8eDC1MQIfcD9XdymF+1A8=;
        b=YBAxQ/F2aA2exbPF0wpdHQU7ha804j0bMZkx1PKPSWX06lMD/ogMwmv8HpJTbmp9Lr
         OJR8FqUVzzHBVdc41tOlIO/0KDKZUwbSRoeN5hNPHzYyUtwsWgpc7uoIU0/tdNQ+ojGw
         aZ66BZc67ZxO8eZnXBMwYByJEK45lykzd8MuK9FK//2SW9S3EhZI3q68nDiC5wnJZHMx
         JguDF3g1EjCTn8xcR+ILvD5WRTZX9pluWyw6Uy9lGDe4cTyw9cV9ptctbl59ySo2J79/
         HtPjW3rnJ+beOrSPzDYO+ZjBfTEz6D+4Q55ItnesI02PClNE52Txv3kPPQeb6r4kVhes
         OKuQ==
X-Gm-Message-State: AOJu0YyzF/fvYXNuSielmD6Sqo8IfJlaD+YiHqDj44T8IBGywk2EK/BY
	68PHavyI+DyV7WoBK1otSQ+LD3krbGXeoO5md/HNU3DlkxlpN6EPa/FG
X-Gm-Gg: AZuq6aI3fmmLGbwiRP34ziA55Ye183KNf6bwH/PHlRbotrYk4h4t8BMOow0670oGRAY
	phsW0VdlxKStEk1H9u28j3z8ZIe20++J+kq6aEKHg7ud77Bv1+TZJ3vWuJj3iNa2EcJPVOgxTiM
	ZFTUNU/LUi80U4dgVEh01h07M1j3wrx7koOC97CxsMHmNtgFvStV6JOnsHFsBkEuwVTX5WnoGGa
	tfJPJL+t8by+cQLNSTUYx+KHayf8U49ek2bAJiOolUp+yJPa8sZ/mv+NICeSpRJyO+sAmDqF/f3
	ZAWAN6RWO9F0fqCZ+qO45+67pMCjRyZ7dL4GIVhHMTu5pZBel97Xt8o8vylciZG9tu3RTlkpx5R
	qi5MGzTsxVzzxSofR6Cx0TVVRsPGWl1Wj/udpj8N0OmvtaDcpvHAzsJZVmf7fBBNf1pDIZrCTut
	NVRbgEqUB/KrOufMp2S/8vz1OAsMXfoIuGey+E/lBQqVWo+TQTc3BsWApSZTPshM5osQeKMk7Kc
	AC2Qw==
X-Received: by 2002:a05:600c:4e54:b0:480:4a90:1af2 with SMTP id 5b1f17b1804b1-4839c002d65mr73263895e9.35.1771501041214;
        Thu, 19 Feb 2026 03:37:21 -0800 (PST)
Received: from localhost.localdomain ([196.119.106.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d994670sm529327955e9.4.2026.02.19.03.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 03:37:20 -0800 (PST)
From: Reda CHERKAOUI <redacherkaoui67@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Reda CHERKAOUI <redacherkaoui67@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] arm64/mm: harden ASID allocator against empty bitmap after rollover
Date: Thu, 19 Feb 2026 11:37:14 +0000
Message-ID: <20260219113715.8001-1-redacherkaoui67@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_033723_986330_3F0DCD66 
X-CRM114-Status: GOOD (  12.59  )
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

new_context() assumes that after incrementing asid_generation and calling
flush_context(), find_next_zero_bit() will always find a free ASID.

If that invariant is ever violated, __set_bit(NUM_USER_ASIDS, asid_map)
would write past the end of the bitmap. Add a defensive check so the
kernel fails loudly instead of silently corrupting memory.
Cc: stable@vger.kernel.org

Signed-off-by: Reda CHERKAOUI <redacherkaoui67@gmail.com>
---
 arch/arm64/mm/context.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
index b2ac06246327..74c1ece7db78 100644
--- a/arch/arm64/mm/context.c
+++ b/arch/arm64/mm/context.c
@@ -160,6 +160,7 @@ static u64 new_context(struct mm_struct *mm)
 	static u32 cur_idx = 1;
 	u64 asid = atomic64_read(&mm->context.id);
 	u64 generation = atomic64_read(&asid_generation);
+	unsigned long idx;
 
 	if (asid != 0) {
 		u64 newasid = asid2ctxid(ctxid2asid(asid), generation);
@@ -194,9 +195,11 @@ static u64 new_context(struct mm_struct *mm)
 	 * a reserved TTBR0 for the init_mm and we allocate ASIDs in even/odd
 	 * pairs.
 	 */
-	asid = find_next_zero_bit(asid_map, NUM_USER_ASIDS, cur_idx);
-	if (asid != NUM_USER_ASIDS)
+	idx = find_next_zero_bit(asid_map, NUM_USER_ASIDS, cur_idx);
+	if (idx != NUM_USER_ASIDS) {
+		asid = idx;
 		goto set_asid;
+	}
 
 	/* We're out of ASIDs, so increment the global generation count */
 	generation = atomic64_add_return_relaxed(ASID_FIRST_VERSION,
@@ -204,7 +207,10 @@ static u64 new_context(struct mm_struct *mm)
 	flush_context();
 
 	/* We have more ASIDs than CPUs, so this will always succeed */
-	asid = find_next_zero_bit(asid_map, NUM_USER_ASIDS, 1);
+	idx = find_next_zero_bit(asid_map, NUM_USER_ASIDS, 1);
+	if (unlikely(idx == NUM_USER_ASIDS))
+		panic("ASID allocator: no free ASIDs after rollover\n");
+	asid = idx;
 
 set_asid:
 	__set_bit(asid, asid_map);

base-commit: e81dd54f62c753dd423d1a9b62481a1c599fb975
prerequisite-patch-id: 22f87920fde15a41bcd8a3bd8fe539b302e7cdf6
prerequisite-patch-id: ec2431c51c9f770252b0fce915a005a1ba17893a
prerequisite-patch-id: 2c19186c084c72a802b57b9878d71130fe48394f
prerequisite-patch-id: adc51aec081387d09a3b281e4e5748fdd6ee14a5
prerequisite-patch-id: 6ac6e6c6098767416a9300e39b92c7384a9a186e
prerequisite-patch-id: a90dc0f63084ceb49de3abc95edd5dafc113e1c4
prerequisite-patch-id: 439c78d86a96600b1c6248c455c1900c72c9a741
prerequisite-patch-id: e58a7400854738c6c42651ff38eb98418b55e6d5
prerequisite-patch-id: b3ca97b18c710b641be2050e79a408640a68ab2c
prerequisite-patch-id: c05a84db123b3a19d69478c605493fec9e4ca27f
prerequisite-patch-id: edfd57c532173e7da3d42726c954bae4104b6ab1
prerequisite-patch-id: f1811d2c1b87de41c65b99f6cf4ff8e341212b8a
prerequisite-patch-id: ef830b5bbeaf21bf89975f6f16b02de92624820f
prerequisite-patch-id: e52bc8e14b5707ed21bd8fba79ee7c2f8a26d993
prerequisite-patch-id: f89a8a0338316f2f20eec6d5ad1952539500dc58
prerequisite-patch-id: 452fdc87d9cb78fb80b88069a3d9fde55b0efaad
prerequisite-patch-id: 7996193466732bf62baa12f03c862b13c97d9c7f
prerequisite-patch-id: 4c194ac3256c03b4c1033a98b089fa593f73033e
prerequisite-patch-id: 65093dae7d971062c5e5f884c653bcdc70b84828
prerequisite-patch-id: 53044bc5fa50e112d32a6e680abe0d7c8fa96670
prerequisite-patch-id: 95cdbf02b71ba41758f4b8f4853b52f3c54044ca
prerequisite-patch-id: 85105bbc627eacaefdd7295851be19df47f49845
prerequisite-patch-id: 40960ccc2359a6344d10b9a22f06dcfb6e43dec3
prerequisite-patch-id: 1e63baa39ba967beed4d766fd50bc2f43f2a5a3d
prerequisite-patch-id: 3a289c850360d0bc5c982958799dc4ef523754cf
prerequisite-patch-id: ae7a5a516a4811f5d273d88a499f6767a9604639
prerequisite-patch-id: f5b60395d5bc8dfa8194ad0428f7ec0d4d047436
prerequisite-patch-id: 782f2b53e4213b82e42f7a565ea5a16dbc809b30
prerequisite-patch-id: 46a46c573447de205107a41a5c51d4575324a497
prerequisite-patch-id: feacc3d487c33928331b3c93f9073b81458b1124
prerequisite-patch-id: 5fe4f215cad7cdaf8b2b22fcb5821890c1dfdb4b
prerequisite-patch-id: b9ac6707b3e65b48750649c228c7f93c28b6ad21
prerequisite-patch-id: cd05fd80f846f03626dc76825f5128bb7b1be7a2
prerequisite-patch-id: e3d46ca07a835aa234cc92a28ff7c07adfca311f
prerequisite-patch-id: 7a2ab9b79242aa8c1e0762b335569b81697838ee
prerequisite-patch-id: 8e39c21980c438a22291d7111c4bf000dbf1ab35
prerequisite-patch-id: ba11d83f3dd7dcc5b4cfa059d902007864018db7
prerequisite-patch-id: 94f8dab0c133fbb8521040c0d1915f974d70e954
prerequisite-patch-id: b09663997259354ce9b464dca2240d5d0d55bd6d
prerequisite-patch-id: 21bc085415d1536e524c982f47a060abf674a3bf
prerequisite-patch-id: ef3327d316f1d260f903c0328956b1406b9f3cc1
prerequisite-patch-id: efeb53ae433a819e26bf1df452f454d1f36ac996
prerequisite-patch-id: e72fa1b01b60178684de82cb5b25cda9fe535762
prerequisite-patch-id: 3605a9a71bfbcef7c5d34ba568616e66d6ac5eeb
prerequisite-patch-id: 0ed47968f624e1389286e010ee83410e2b4879af
prerequisite-patch-id: 13c97ae55bfbf5ef50aab069c56e06c496a66387
prerequisite-patch-id: a641e1678b62a7dfc074b39dce50063044a6910a
prerequisite-patch-id: 81c80edf831fd18df182dd55a95e19a7788b8d67
prerequisite-patch-id: 5f9cc3715a92f381cc72bf15390c786bf84da582
prerequisite-patch-id: 85e33941bccd1953f006343ba130f71853bc44a1
prerequisite-patch-id: 7e495ce521122a252337cbab8388b1ec1ca89116
prerequisite-patch-id: 3a72f14c14ce47eda8a484d31b7f4ead09cfe820
prerequisite-patch-id: 01785969efe30458b0ecbccdf106b5fe4321c402
prerequisite-patch-id: 85dacccaf125cd446530bfeb4ab9bd510379dce4
prerequisite-patch-id: 749c36dbf8cfd0dfdf2a54a20e480e472ac5782b
prerequisite-patch-id: 74ada3b892f6d0517afe15d30af42a01e41c96ff
prerequisite-patch-id: d15b8179925f2a45fcf593d6a3ab98fb3fdfecba
prerequisite-patch-id: 7db4315ff91800c9519fa58ea509789a07e49d04
prerequisite-patch-id: 054286621f172b63bcf5b4a9d9876ac583bcee9c
prerequisite-patch-id: 9adb9dec437dfe262e043bb69af91da001c6fbb2
prerequisite-patch-id: 0fc7fbf11dd9538b613f35234c74329728909b4a
prerequisite-patch-id: e4b29be53745b43edb478cb8e774138f6fbcfad8
prerequisite-patch-id: f2c52d2b6a7a0714b02c3a6f3b1ac3619727277d
prerequisite-patch-id: f402ae3ddc4c4f2ff323f000240dda39fea17ce5
prerequisite-patch-id: 1d08697e4cbde276bd4cf54c17ec8d53ebf2dd2e
prerequisite-patch-id: 90e5f09d454e2964379d7809985c739a5fad555f
prerequisite-patch-id: 605d53b7b189d4811ca2bba6a5bfe0f1d454bbfd
prerequisite-patch-id: dad47c70bb2236a93d14dd119ad4da82e27faaca
prerequisite-patch-id: c278c5ddfdf522a71b7f56116e628a2195e2370b
prerequisite-patch-id: 13c30164643c6209774a63a85386f39bb61b2867
prerequisite-patch-id: fac3d8e60c357873791c5d0560ecb9063c0d6257
prerequisite-patch-id: 092325494774dd9d6a4c9ea46857bb04da7eb298
prerequisite-patch-id: 279aa6760f0b48bfd486e8d54dfc11265000cd3b
prerequisite-patch-id: f55d22fa56af8d4036a17dd97dc26abba1b8272b
prerequisite-patch-id: 95796e58849b922e821afe7c6705fa2ae011651c
prerequisite-patch-id: e3bbc765c8b475200e39a978bbceef5d35f1d080
prerequisite-patch-id: ec89759415b7ebfc622021b157336340a318098d
prerequisite-patch-id: 506e6a70dca5ee39b50ccfa60e2ced1a0af087bc
prerequisite-patch-id: 5ac7925b303ef62e4db34c14c3356bcae42a80ff
prerequisite-patch-id: af57671d8c884445987aa4c090b281f29eb3ec3e
prerequisite-patch-id: a388f524b9815c9c0e03d386ff32111a4e3687ea
prerequisite-patch-id: 0bc291b25b061c058113f2f3e1c72ddcc036e622
prerequisite-patch-id: 9411713490d13ea4600ae82c0eba30919706d046
prerequisite-patch-id: b6816b3109e4fea592b4458ff5a79c291261c116
prerequisite-patch-id: b6e78bd768d4ef716cef075e1384b9b639c3ab56
prerequisite-patch-id: b36a655d1c5dcdbb0f713a5e4409f078b8828ed7
prerequisite-patch-id: 8c9fbc12d263e637647692150ff4d154bb65849e
prerequisite-patch-id: 43e8e509554153335a8e8807920b2cb2e2b637bc
prerequisite-patch-id: 77c2d92765f56c384b9d2fb94d83116747617333
prerequisite-patch-id: fcd85237a13b559a63710d99be8f16146921a22f
prerequisite-patch-id: fed309bf09ef1e0857bf638aafffda9ffbbcd754
prerequisite-patch-id: 246360d5bf7a08c200b1de6796eaf8c83bf7f288
prerequisite-patch-id: 29a2581a1ef414ded63330a9af99e3130448bb49
prerequisite-patch-id: 830b443dc9b00e4c9e2b1471c6e06a834e90d2f5
prerequisite-patch-id: 23787887aa333c584ba4af375023ec66a9fc1c96
prerequisite-patch-id: f9ca5c279b0d407580b4de075528aceba00f42d4
prerequisite-patch-id: 44513f2ff9f411e4fd7f881ff2981b25ca4dfce4
prerequisite-patch-id: 4f9d9f5a72db045a63ebe727844f7be4e360bbde
prerequisite-patch-id: f88b6498444b037b3bfdb50a270053566b7890e8
prerequisite-patch-id: 95eb27f77931fa25c26fdbedf0b78184b9eff5dd
prerequisite-patch-id: f41f9a637f8643204a1c5426209a83f5330d549b
prerequisite-patch-id: 3d37dca84c27966a7aeb24abf31c233a2b4afb75
prerequisite-patch-id: 58f594ed838d31e4f4efe12c379f8e15eca37f3f
prerequisite-patch-id: 23808787ea1ce216f9386072150fa3f24ea51a2c
prerequisite-patch-id: 99b7bcb3f743423c096dadfc429240abffc328c4
prerequisite-patch-id: 4d4fe578158c1235c5c958349e690f2bed1bd6eb
prerequisite-patch-id: 5cac307307e66d4e0412f5c4f3ec2268fa7d3b61
prerequisite-patch-id: 2488e190fffab8b6d10d4f2a3c49aab3d52f4011
prerequisite-patch-id: 4b01f79b9a629ab30aa488e0058190354c39fbb0
prerequisite-patch-id: e0fd445e24c811b2bd11be0bb55660737918b2fd
prerequisite-patch-id: 1a34cdc176dc1c24660a70abccfe63352130399c
prerequisite-patch-id: bf22b3c018d7e8c1f5351a0e0510efa91cd79a07
prerequisite-patch-id: 180c9aea0079a2376014a9e0f7dcebaeeffe009b
prerequisite-patch-id: f7613927f20680b112b04ce936712f089987e5b6
prerequisite-patch-id: c0217832113843dd92e16895cc162fdd42e08f13
prerequisite-patch-id: b0562e98ab43289a132b5d53e67abec999e1c961
prerequisite-patch-id: 6037166621577b3ba8d17ef6efc11c07d4c61247
prerequisite-patch-id: 0ccbed6842d04dce6745503711c5087abf466444
prerequisite-patch-id: bfa30045c92a627bf67316ab309f0ac3fe63ace6
prerequisite-patch-id: 7ae723dc9e034057df3245599af0d982808ae04f
prerequisite-patch-id: fa43328b102fcb0e994606698dd452b564d26e60
prerequisite-patch-id: 3cf9432225d88f82ad3bb777fd65e094168ef697
prerequisite-patch-id: 0be61bcea8890fababaa0fd57448e060c0d5f499
prerequisite-patch-id: 388d328c1e48fc451f7cf82bb2f2b5490d2b8da4
prerequisite-patch-id: ca0490363f2862fdd336866f1f5045c83a92c948
prerequisite-patch-id: 57f171dee52f8016c3044479fd9b28ce85a546e2
prerequisite-patch-id: f6034685fbba3c42aec0923e38223d6b1e2e1a04
prerequisite-patch-id: 634ea90f6f76e47ed52eecff5153cebe438fef2e
prerequisite-patch-id: 79ada3fb541eb23deef521af8f4d1cd14c69df38
prerequisite-patch-id: 871262a0c242ef17c675b76b00464079a167de50
prerequisite-patch-id: 5ee86e677a2c1509630ad1a9a440ea4eeb06ae7b
prerequisite-patch-id: 316fbe97c5f6f71a705f831c8b762b450e53a50c
prerequisite-patch-id: e739f9f9db57147a64c43b109ff3336779715ef2
prerequisite-patch-id: f11e1d7f97f6125addf3c6c224d75c33200f5eaa
prerequisite-patch-id: da1cff794d0064529cba960cfdb56c41f0018bd7
prerequisite-patch-id: 766b442e1850b06a61416d2b2ca9fb156398440d
prerequisite-patch-id: 574c712350e60b9591ae8f65eff2550f6d7bb732
prerequisite-patch-id: e530e171bf5fb68dcdf28f76ed96fd5e64218148
prerequisite-patch-id: 4c32c981ed4b37a65142da87f33bb64a3dc175ba
prerequisite-patch-id: f5b5c5f996b9399a22d13d3fe75d2002256d5601
prerequisite-patch-id: d24d3f2fd11f725e372054fa5aadd78558fae864
prerequisite-patch-id: 16bbb2d4b38dde92695f351d8cb999e260fa4e2f
prerequisite-patch-id: 75de875ae3fd93b5f4db3ec565476e75a4b3462f
prerequisite-patch-id: d301590c25d1cd76cc3a03808006064d4e8795f7
prerequisite-patch-id: e957d1823bc986ce80f140d6ddc3cfbc4bd4523d
prerequisite-patch-id: 8ea6d4503c9bfcd3067bd0f63c41a3bbff40cfec
prerequisite-patch-id: 8ebc109a0f7ccf15ae90d38b115494868ac3ce36
prerequisite-patch-id: 4cd7f642ce4dd9411c39fa74959ceab3c4586f49
prerequisite-patch-id: 67aa6c34b4e9f3d9b529036204b9dbda1a5fa61c
prerequisite-patch-id: e60ccf5f93289a7d293d7294882f1e8abda2f704
prerequisite-patch-id: 873432903506b7d31a68d5befcca54deaeac135b
prerequisite-patch-id: 014d1c866f0bd7049251b3b9ecba9ed6c934954b
prerequisite-patch-id: 6402441f355032d0518f7f93cbc536151fb5b498
prerequisite-patch-id: c6ff016d3ebe80bcce70a0da7516c03c1ec40110
prerequisite-patch-id: 03739af11937bd73b9f4103422556dfd16ffdbc5
prerequisite-patch-id: 7ea7b8084505621b3152239961546991b2f9c42c
prerequisite-patch-id: 8c6e7bae3b1974f33f9def7e4c91b8e97a766ff5
-- 
2.43.0


