Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC7A103E19B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BIqoWgKmQyuYPfu/JHLpVodU4oDvKEbNfgj2XsNto0Q=; b=nQYwnnSVV4gOusJ+aFZrAVhsAn
	Rmx7L6fqJ+PMrw/EGvX+7XXidbkXozDl6XyudiyQ5x6CnkvhxM40/u8duta8CQ3i/HEsVMFXB6nx0
	SlZL+5tycIXRdduiVYKNwQjC4im5f15LS148TZpWD2wfkqZPNXEMItJiZowImBlLJCE6ZPnZv9epW
	EvadQUjIUC24zxz1wgcqHxXnB0MBYpwU1aGqbyH3+kiVtlm4mMUhV4Yh9ILHbgjyOA59tAhPUhwOZ
	Pmo+mi1OqXJUBENExtCXxnMJZPubPqMfqZHpcxOxSpYr0WFyc1i3ILdZlBK9Qu+IjovCHt5ZYfDsY
	dknozmcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2t09-00000008jhB-0KQK;
	Wed, 18 Mar 2026 15:40:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2t04-00000008jfZ-3kOP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:40:01 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFXC2l1768938
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 15:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BIqoWgKmQyuYPfu/JHLpVodU4oDvKEbNfgj2XsNto0Q=; b=cTy/Y/PIlh+7bFqp
	FIrmo1qZ5qEsUdB2VmJnBdLzD2kLOJezYsUbkX/37bz2+iVUflOtSOBLHSiF48Sk
	sfB3BPxYNHezc90psZCgTpQzxFCwLdntTZ781JRv7KeZkPxzg9VV3bZSDB4P1Qy0
	k9291c1Q3Ziu6nBnH/Z7faQQYRJA+1GtXidiB2a2Deyf9PDJPw9T+dgAtgj8WbQ3
	2wg8CgOjOPbODF6G76wlv3yWiz8CjOOTrGHEhWu4p5UAK+dw4O4LVDyFKihVpC9V
	pJEwKdemRfCRqzqitNQ7C1PzZ+k+y0hGfugCKmnYs0XwcbcmzOtPA3srenURuuym
	ek4cLQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cykqetx4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 15:40:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50925fed647so23955991cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 08:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773848399; x=1774453199; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIqoWgKmQyuYPfu/JHLpVodU4oDvKEbNfgj2XsNto0Q=;
        b=FORPQtnsNfSFRQKjNY4gLupW1D8eSI3IN8wzGov8SEXTkwbISKpkMIO6rh7mOTk8eh
         SfqRfFj42a4BzGVSRWA3bl4fIMgNwwBbT9Y4oGxEYU2QhnVpt+gkJbp1NDIcM6jVKH5f
         iHqi1fOX291P4R0TQYtjRiqwYowXhSVV65TAoNfXWXOZhT8B4PRE37RGzEiAlrdX4PqV
         SiNQtw4HTxMDvgpBpr2QTweO3XFLDYXC8JnZiwRJtes3ZdgbqAsOQtR5eJmXcNIf1PcE
         yNQbaqtH1BK9ru7ooGZk/h0iuh/RLD2wPM6si/D0gwknlrX0/IMQ+VMxbuDmQBn3xu0n
         qr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773848399; x=1774453199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BIqoWgKmQyuYPfu/JHLpVodU4oDvKEbNfgj2XsNto0Q=;
        b=KeQZmgUPHXSpBbJjlI0HjecEW1UsPYBDoO9A4uG4luBTDJjY8jdZCzCe7LXk1ref3M
         IO1TjpBcS0qqMGvBwj66d1tLopy3hYJG0h81HQ++Lza/3lsHhZTqH24lgEZqDpiaHtB6
         yKwNCxnFMKWA6UINyuy0ToloHV3Imq5/v6yaVY9W2/ePubDDGCjsnFa+ixD0wBb+1sYR
         HE3wDL9tAdhXaoo0iWmzn4QhV0c7QMjhGdqnThwRAzJbfmA0wzfnnz5uAX10e1kwKtMJ
         qU4pJxvoJzumO74WKA+iOVpY9RZgptXB7XInaldbogCo1Y3TkpBkEKFSp/r49tHnc8z+
         dBVA==
X-Forwarded-Encrypted: i=1; AJvYcCVJZ5wzHL5JQtdtQj459J4MPL4c9iJTzUvYwX3wg7y8Frn9/TnAd8IJmEgggJapahuAqJ1zT4rR6ciaZfInvStp@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/uXLZPoKhe2ySbETOAV8uWbLKuGmQy/fti6umgEMxXoQsQ7zt
	ExQB74OUbhplE2eUu2DO/2oKxVRuOY67JxbdFmmtiZgrKQXZu0o1J6Vp4onox8DQr0L1g+9gUbq
	tx0yCI1qz+uTH8xiD9ZJ8LbRaMKJrU5SeLB3Uzxo3gMSngST6MFK/9pv7qmG1Xqev5B2/Myc9ym
	DAQw==
X-Gm-Gg: ATEYQzytofHE+LNTvfWK6PPepR4gJi+NKuI50gP5OF1w1i4BEl1MzkSaPyx3g+NI5x7
	H6dqJFUycAAeL1i5H3Fkt96chaXcYwbMDUWaYrLkY4QaSbQVgHaSx7SKFve+EOZ+GbXOYMYq8Kr
	1AKUdR1Ii5VxR+/8vR/I6gaoE63HlFbACtdzpTHYDkMwChSyo1a2He699JDGW9P+jFD5uxNMhGU
	WDBPeBDlbgQ8GNnT0LPWMNVFYvJY/TUQx6P18XErwhxPm1LMFaJDmhI5XFnbtFhf3RW9yFM1+/K
	xGeOS8yfwwXocCx2atXpq+bOCpa8HqzF51PXj0jrzkkr5DzYBzt5sOCOZTUfLIe2/aYGT08KMRA
	n07Uf2XezrdFol9s5h6nv5asblaI=
X-Received: by 2002:ac8:5f8b:0:b0:509:3367:c992 with SMTP id d75a77b69052e-50b1477d2b1mr49860021cf.5.1773848399253;
        Wed, 18 Mar 2026 08:39:59 -0700 (PDT)
X-Received: by 2002:ac8:5f8b:0:b0:509:3367:c992 with SMTP id d75a77b69052e-50b1477d2b1mr49859731cf.5.1773848398744;
        Wed, 18 Mar 2026 08:39:58 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm9227560f8f.21.2026.03.18.08.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:39:57 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Lukasz Majewski <lukma@nabladev.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/4] clk: vf610: Add clocks to support MTIP L2 switch
Date: Wed, 18 Mar 2026 17:39:33 +0200
Message-ID: <177384710706.3709943.4851926053225673193.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260129095442.1646748-1-lukma@nabladev.com>
References: <20260129095442.1646748-1-lukma@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEzMiBTYWx0ZWRfXz4EhqJM0uQYo
 JbnsFdXo2RB8s8FqQfxWEAjTKAZ+OlP3nAnBsmzPQ8bPU21axzIK76tWp/dGtPSKl0IB2a4qYoL
 2OCHOJ7tTuhXdfxbdMrMEeJPd4h7o+I5NM/RLxixVfqk37qil6aeHNJ0K85tFNiocRfrfSUr5ND
 bKdE4yaMprfLlamISnhHpfToggWjCOqdC+Rck4UOPfnFQAqld125f4Qy2aAqqO4NiDcoXX86kEx
 ynVvP2Ti7Ghq3CAP4CQokumP7P24umeANVYoOlYhsHBTl2pS1irVTXeysjZM8i+7dStmM/XvV2i
 MpVGfhTtp2MNVsNRekb0OnPR2UboqUuvpqER0mRdhT6N4m4DAqP4s8hLvsVcu6mNFX8FTPWbB7C
 u8gN23r58HRBLEvMS+PF62AWjeiRzIOOE1xJQ3vhU5eVN5BeXeM/6AvfJLTCZyrrSKKXIiPMGor
 O7GZta3ikR0kPxW0GwQ==
X-Authority-Analysis: v=2.4 cv=Cd4FJbrl c=1 sm=1 tr=0 ts=69bac750 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=15QbF078PdIEimGHe8kA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: d99QQhiQ7M2wzdN5wh_FYmUCd0QRu4AT
X-Proofpoint-GUID: d99QQhiQ7M2wzdN5wh_FYmUCd0QRu4AT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_084000_940634_6C504F85 
X-CRM114-Status: GOOD (  13.26  )
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


On Thu, 29 Jan 2026 10:54:38 +0100, Lukasz Majewski wrote:
> This patch series:
> - cleans up clocks' setup on vf610 by moving VF610_CLK_END define
>   to driver code
> - introduces support for several clocks required by MTIP switch IP block
> 
> Lukasz Majewski (4):
>   clk: vf610: Move VF610_CLK_END define to clk-vf610 driver
>   dt-bindings: clock: vf610: Drop VF610_CLK_END define
>   dt-bindings: clock: vf610: Add definitions for MTIP L2 switch
>   clk: vf610: Add support for the Ethernet switch clocks
> 
> [...]

Applied, thanks!

[1/4] clk: vf610: Move VF610_CLK_END define to clk-vf610 driver
      commit: 2c53aa5878f9abe6975ca45591b8e3357794c0e4
[2/4] dt-bindings: clock: vf610: Drop VF610_CLK_END define
      commit: 216ad764f8d8c53b85cc74f6090f8d132772fec4
[3/4] dt-bindings: clock: vf610: Add definitions for MTIP L2 switch
      commit: 819bfc68251484bb9ba4b6cf91279a80c0fd7047
[4/4] clk: vf610: Add support for the Ethernet switch clocks
      commit: 5567730bd36614d8099d73520760c298e80e0fc5

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>

