Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D76C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 13:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0iUvEQEb5V0jbH92pD3f0+p2Tcm2EEwWR0fzZ8QJ/4c=; b=W6bYwOSFnthw2i5mIMSTCEQnpP
	hTcOiKaAmX0a3xI/nb4isC56UsxZpt8PU6cfGX2FIcW2S8AFkNUrqEE+2pg2ntQwTTHL68VIXxM0f
	mI65+ZUlG38493e0JaqfDaszvQHpXbXcGycxMhpbN5HmzH3p6p25CfQbcdD3s2T8t/DtM8l5lMexb
	KNupcClEslMWJZ4fm3I+ZVZJocVNaRd1cqVz8YZpcQN0bINNC56DuFV1TModMfy4kW99iHNsYzufP
	LYvGe3zM86GWVeMrToIRVvFOkctUkGX37qnBTeSOHqd2k1ospsxGUhOpp3iAGKDA5BKpX8jXVSxET
	CUrwwp7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGbZ-00000009NJl-0c2C;
	Mon, 13 Jul 2026 13:21:53 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGbV-00000009NBs-1Yen
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 13:21:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=0iUvEQEb5V0jbH92pD3f0+p2Tcm2EEwWR0fzZ8QJ/4c=; b=TTkg4HmRbvwBPpOwHiuHX3DxhE
	ul3V43UBfE/wnq1WA6DkN7BZuf5xZHFUIBz+zkkDM+EA1UQe/9eVO2oH8TbYVx+SkH8EDa52qs7ax
	QooV63tcRrgt5OiAQ7KD4cK55J/BtHAJ96vAVjGdWClYgbbJS1GuDzzX11/TSMBhLekHx6Bp7sL1r
	fULqve51GneboqgbmgPq3jvB7M2EE4h8/CHQ1Oi3mHVzNNub7TZBqxJrA9frRa/cuIe5pXm9SxP75
	7FfBfXSPP3ulOL3hGqGssavI9ncJH/SkYSwo8DKoXi19YVWw3zm8+OdIVBEqmOJDXO7YIjiVb/Md7
	o+Q/pjfg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGbM-0000000Cyhm-0evy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 13:21:48 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDvIa1494358
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 13:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0iUvEQEb5V0jbH92pD3f0+p2Tcm2EEwWR0fzZ8QJ/4c=; b=LglMfE3iuaXTOvC+
	Glk4qRQYP1S5h9C9BHTI8RQ5NJdjMZyMlsQsl5fbGN9kik4i7RA6B+kaxzVWS/MB
	AQ2J7J9DdIO8JCI1nDryAb8EyOQVoXHM/Gj/e3SfGjITUXUKhiiGqt+mvjpjEr5u
	Qtj5cWXSLd+AEl2d3ttJR3sh8V6bl+t0FWOUS4pVtm5zBFlaXd91t/H7WGorLh1Q
	xFp7XV18n+LvRnwDND0XpCMXYqLQvtYTEBLi66TqPSoB/JWUvFdxsXMu2LhjX3fl
	bBeT3r+MDRz95I8moyRXQ+uTEWUQMT/TAkSPos5ZuZb9lbQOJfRhS2UO7qLKesAy
	4YslnA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm2qhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 13:21:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c110a3b6aso47795301cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 06:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948893; x=1784553693; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0iUvEQEb5V0jbH92pD3f0+p2Tcm2EEwWR0fzZ8QJ/4c=;
        b=Y2avs3mSBPg66rWEox9g4aOyP7mROxHnLp1PL5ptXh2wACT6H/fzeqkTKfagQlP+bV
         bIYq7FU997J5/YdH2zGFiscsNgx1DKeTkfMpGbly7Dpw2Oy4iOQhopZ01FzFAwgN1aE6
         XU02YafimA2t/Bt2NRIDUxEZ0Fhm+TerixEab3ePDdsqZigeiEVc9PIK9DET8Jm8R8mY
         ZYk5UrwL7BQ5KTk7Q9Ew9Q6u3cothl/UNRCcmQYC/4D7htCfrND+X5GXp4kyfEJ23Zpf
         onB4/5OwrJ6qU6q+i/LvehNzep3gAXAjb3xOpDw2ee6FZNNAiqVGydRmc76jALDNRWDJ
         v5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948893; x=1784553693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0iUvEQEb5V0jbH92pD3f0+p2Tcm2EEwWR0fzZ8QJ/4c=;
        b=bBQHYBmyEcm/CjXI1gWEwykkIDIwLWF07kgy/BvaeT+QV9A23Y6Aiz3O9wIQjsCIqn
         awHiejFLs8ga8cyQbir+TjufNpXSTBc08P3X/FtNJ2i6efthCIusv3NDfBz0SeQayCBl
         awjRJVwUWK06nsaYtVLeHhGtln0MAccs7NowKUnm8yD9fEznRHn4WTI72u+x7SJB+/e5
         mNYCE1uu3Ng9xESNCJIiyW05K2gssGkB/G3Pa27mtrz8e2WqV28iPzEdfcy0oTpbwTov
         9yYq4zjXOT2tECYDHj3Zk4byUt0m9CHxcXACOuxPq897nsIxppgEPdeyCwNpoMOnA9YO
         LBfw==
X-Forwarded-Encrypted: i=1; AHgh+RqnjvSUtkSLXVbABFXNkrh9Z1gQvIjJS3WmJi8haJgAjJVNmd3fVZFY+nlf/UKM5WdhqqGieovLWOZeSQ3ncDyP@lists.infradead.org
X-Gm-Message-State: AOJu0YxBGYvGOei+fXRYhzSRVArozFxdUVUrY+B6g/g6L++QVWAogtSc
	Z8yZERDiKICvZUIg9Pacoe06A+SEdJau1WxL2h6qfh/tunYRQ5Op/+NaYrFpOptGePxwT0X/yK2
	vr5IZqPTtJcWCh4+eZcrDXnYr9+2Jz3p3pylrkr2nH+GMVqSEz0l9XWNj52cZmixoKjHTJLZL52
	BaxA==
X-Gm-Gg: AfdE7cl6xFaMfS2GfXCIxpAUwPtVx73ZfknitUBJnXM3qMceOPjv7zUHap/NRPnwcvb
	6Aceg/Ny+BvI+AIL2LG1Rrg9hfcBa4BK0pfN39FBEaafwWNZwWBakwGX4gHQary4kENxYATR6j8
	0mY3pAUY2ZcIMvu8qWt+Yu1fvK3LjcZOyXOEX8ZnyOKbXPUZTVq7Jrvdu8yRGvIKYpzUWDXNXn9
	IOtbOnWsHForvvDH94aoCoZrNGYWirAhdWMlWKt/hMMpyeJvHQi41J68RCCwrgopSEFc025AEfu
	ShbeOFnEaFk+EjkK7Dmshce0WBp8KiHErmIIa3UGyvQKlDqm4zfmAruUkWko3XLFq6w+uw8kZVf
	uOIJ4xBoLXMLPzbWN1eOEHqt5YHUoR76ULMx+GSBt
X-Received: by 2002:a05:622a:3cb:b0:51a:6feb:dc8f with SMTP id d75a77b69052e-51cbf0e0756mr87983151cf.9.1783948893505;
        Mon, 13 Jul 2026 06:21:33 -0700 (PDT)
X-Received: by 2002:a05:622a:3cb:b0:51a:6feb:dc8f with SMTP id d75a77b69052e-51cbf0e0756mr87982631cf.9.1783948892921;
        Mon, 13 Jul 2026 06:21:32 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:21:30 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:20:36 +0200
Subject: [PATCH net-next v13 07/10] net: stmmac: qcom-ethqos: fix SGMII
 loopback not set on resume after speed change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-sa8255p-emac-v13-7-119f8699ef8e@oss.qualcomm.com>
References: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SlOf+BhDICNYWid3SpsPo349aSqYaDdHZpfmoCBZZHw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOY6LAQcF9quKJEcvEh90UXYXlVsW2Jh4yWPh
 RRmPDlSot2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTmOgAKCRAFnS7L/zaE
 w9aqD/955VoK6LaO6vaDxw6NTt3itus8v3c/OJJG0p98jDFCjD9YC2veyzrofOQ0TKWJWkmc/qq
 5L+Ac3xpoWqBjo9EjcMJwbHZA7YDaQ1QBEwbfrOIYjfwaQvPgRz543CB2Rirv7mpI1ME/ZYGarG
 Lc53Oo+GNT1knmktmT98TP8TPiwyfLnv6s2jgbfzHlQVdSxInzl6Xba6PrCJHuhMLDi43O/hvtI
 hkq2+mkJvQnUya9sbFoNnDO5XbMFOxMtggKVASqfi5yaDZVn7M8rRonjE1EbIVHWfa/toUesOa0
 P2e0vo0oOBPPSXJ3r+YZC31vRjm8PvCtAFda8qrWLHm10Na27nQ6aU+4dKx3LBtP6fXF1t/Sad5
 GVj+DwHrUg0PX0oR+JFTj8EmlXXKuaFe9+36xK4HX8ntTUknyXl/r3jEBsr+BP3e+vriuO1WGBN
 4gURGfViayyslZFJuqGaC3rGsj4SIfzqaN+4tboTUYzP7uHFYkFngFdmj/ItLNcy5oX2pCfSoIQ
 JoFgO/XoSylDbz5dTihBwgI4MureklGQDOz7Y1MVSeQl71Uo6PMERaIIUr/PlMJ2PFikXISCBbz
 B/8f1XlpUku81iFnZGKEliv4krJ2aF3MsOEoa7ov34PUKUoIyWfcroB/lyMGxpL2A5g4yFXqFEj
 krC1QUE24KD0tBA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: I3xYou_pPVYGj8Mlqtj4h8lnBTGs_4Br
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX7jW+cfLlUY+9
 tvZPkXJv8FNvTXZ+hB8gR1sV61sytAGAlZ+t36ZbGyapxDaQdpAK5Yd6jnA+DGZzvZaikFPzsPp
 Iu1j8SHqfAT0V3WqBFVONHhNjmChQFTIBu0ary31KYhOu1CBgF2571LFvYJUsuWmi80Uir5n+Qp
 xkBNgxfCMRh/ymTKgFU4vqLSt2R+Twl6i1QsBQPjWQPYQCX524vs2JOEpdJrxwelYaMtquUJ2Yo
 Ob34J356pE3CAhtTGIAMNZlspUfrJPmr//OojNJN7Ac0pxeNVnxMTwtnesF6qwPNGYXfq0naPay
 33WJCF4uDLNCFiXEfqkOj3/jRTnky2hqbgYb1Kv8jHhhni06ikEmnIXF2f/xSR87bEOI1trL3uY
 dDIF60r2iasWNOzYT0JDufTLK9rk7fc6xNSf6NE3mI/YourYipAyIM3+jZH69E1ze9bK7NtpZRd
 cql7vytnUxZbaKGoYig==
X-Proofpoint-GUID: I3xYou_pPVYGj8Mlqtj4h8lnBTGs_4Br
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54e65e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=PjAGQVefHaMtIuCO3vkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfXyEc2mdV8SLan
 LhqLMzA9xvg+H4iBiFjK+IvGn99vKTbx8+9ZmKyY0kEBsnODOdqa6rHnc+SDINBb0Gc0p+08uwp
 oHzJjuVl6Sfn9UQNpwru+GlVhx9YOiY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_142140_595678_A43F6ABA 
X-CRM114-Status: GOOD (  15.34  )
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

The loopback in the MAC wrapper feeds the TX clock back into the RX path,
while the SerDes is being powered up. Without it, dwmac4_dma_reset()
polls a clock that never toggles and times out.

qcom_ethqos_set_sgmii_loopback() gates this on phy_mode being 2500BASEX.
mac_finish() now updates phy_mode to the runtime-resolved interface, any
subsequent resume with a 1G SGMII link skips the loopback setup and the
DMA reset hangs.

Extend the guard to include PHY_INTERFACE_MODE_SGMII.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 9d19203ae4bd7dc17aca068f5eb88ff830e4e906..e083d7d55782ec8310e9375e466be00213667457 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -190,7 +190,8 @@ static void
 qcom_ethqos_set_sgmii_loopback(struct qcom_ethqos *ethqos, bool enable)
 {
 	if (!ethqos->needs_sgmii_loopback ||
-	    ethqos->phy_mode != PHY_INTERFACE_MODE_2500BASEX)
+	    (ethqos->phy_mode != PHY_INTERFACE_MODE_2500BASEX &&
+	     ethqos->phy_mode != PHY_INTERFACE_MODE_SGMII))
 		return;
 
 	rgmii_updatel(ethqos,

-- 
2.47.3


