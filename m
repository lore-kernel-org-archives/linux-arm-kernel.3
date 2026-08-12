Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9096AC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 09:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sgu7nAbq8Yx5koaOMKJWboxHdobCAGSow6z6pMfKPGU=; b=jgzNYnmzIPltDmKgWlBO9IB3qu
	M8ZAK9Wss+VYjSQc36ow+AAbh/hgJDWVD1TAmrzOVSphXiMuRBMBh8KafyUsSJq+CjCDvG652HWaz
	3Su1FsIlnG/n8NpSrl9JPMGBoMFMD3vIHRhmDHo9sUzCZlqQvC9zUJ5GiSGP8JWNv50KyGxiISKQZ
	e8s0YcDlo9MQUYEitQpPZ+0X0edQpEVDrqKVPRVzTWldSiSWcnSXJdm0mgEn9v/yDMpmvws/2Hwpk
	0QAPT31YplAnSzRr1nOVJXjtLv+JYlFehFv0Y9kcOYEc4YyPkXm5My0hLCBEtG+7U8M5s+J+S6Gb2
	zz0btdcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5Uc-0000000FnQx-1t4y;
	Wed, 12 Aug 2026 09:43:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5UX-0000000FnNa-2aQU;
	Wed, 12 Aug 2026 09:43:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=sgu7nAbq8Yx5koaOMKJWboxHdobCAGSow6z6pMfKPGU=; b=Xf6j4U5gQElHf9I2UpvG0/1KSQ
	kqQ+RLxpScuRwnxKbHtHO3m43N/1LtuUUDhKJTI0pA7U+NG6rIzRbsqUCfyNF0HCbrDnWoce4uiYm
	3siBr558l89/qiPzRm3sXcSUb+qtoc7k3SBvAVWkWI5ZkHmAqGQG3MosO4n5mvX2OZyLJgyarZub5
	XREgoTlvI5dvHY9X9NtAzL2mpLjM9xJAYWkTscezATiFy1d1B6VUjIaIUabH9rMeq+yoAMCQd8oqe
	7YW/LfBYQWZWrC7KkKgt1dfFOBc7EpW3srH7s0QB2eC2+Mnne7dlrkDdIfGyC/qXcM8dr84ImORQR
	saGtdG4A==;
Received: from flow-b8-smtp.messagingengine.com ([202.12.124.143])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wu5UT-0000000FGhI-2boF;
	Wed, 12 Aug 2026 09:43:20 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.stl.internal (Postfix) with ESMTP id ED79A1300228;
	Wed, 12 Aug 2026 05:43:11 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 12 Aug 2026 05:43:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786527791; x=
	1786531391; bh=sgu7nAbq8Yx5koaOMKJWboxHdobCAGSow6z6pMfKPGU=; b=k
	Zrsis232bZfkHFr1KDQEA5RwQSh3Y+f3GqvVYV7nKQF+6G0Db3fpwDhWBdtp3lDq
	51zIJWwgEXcvKId6UezziixDbqKveDd6V1ji4kHTgSOF26xGwYCj0PcUHFEZa71k
	iTH8ZYcceh7LhhvZwL41kxlsdVUgIP2Be8z0ESAYFnC2DexiqoU3EcreOKbm8Uj/
	CICkhL73XQ2G1xyhOtKjLVvNHT9VLmqDB+npmjB3hwgkItvYSxAUMAaWIRRLgPK2
	tccFNYPinP0Y2ZihHkYA9cAlXoYPw3fk267y+9RCWiXz3K1/w/PAkyAIQq5h9jMU
	bLQiOC7C/anypjjDOKaFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786527791; x=1786531391; bh=s
	gu7nAbq8Yx5koaOMKJWboxHdobCAGSow6z6pMfKPGU=; b=fj9Wn+optE2/3n76F
	GwQmq0VW+w7empB07ErfPqBxlWq9ur47tekxJR6whVcMUm1hAmYtmqN4yM4+99jq
	xirk16UW8EvC2ZjyK0EzOFKZaGg8I3j84XXmvFYl2dera6KFC0HgA/TS7NI/wTxf
	RG5xxr/Kkj4NB+NmgIgxy+gfczwrRE6ljtMWREL9fxY7cScuIoSCuwUqdAM1ahdI
	X5w099A9V9iCdYhr5XBONEUrsd/GY5fb3FnO1mm769rUsuRJBwTxJ7h7SvQABjc7
	KDnoc+dctpJpQ3eoNBB+W0nq63hciWa4hAjo1UKinI/AxGIAN29fdMJlbqV3UIgJ
	EqAPw==
X-ME-Sender: <xms:L0B8avEboDPCuuC1vC6rHrdMuJAwgWObuGZMhvp_hQy_jbf_VuLPSg>
    <xme:L0B8avG3vLxS4qsQn3BmC1HPTUN5QCRUknKRpqgXHaJCqg4vAY05jjzzgql0sH_SO
    lVNvleNwk3M834kTt0vzDEf3ArwU9_M3kSU3rJAG_S3AXrTJmUuBKk0>
X-ME-Received: <xmr:L0B8auByJQ0UwO1i8P4tZmcAU4RCegwsYb6-K9vWezrJExzQkJdr-NQzDz9ADiZva2h3d5wgIg>
X-ME-Proxy-Cause: dmFkZTF94piGrtEjR6BqnUD01iAoRBrq3noUWIXMrqVxBmNdzc8ysXT9N2YVYtRNqawTRu
    5Tl3rQYplDYkQz64yVDsKNFMVYgL9BKpjjZZz3bLRD/+XGC1BZ3Esv0AwJfhbuLnvweNXe
    XninG/a9vIk48teTHN+BtpEclMrlsHF+QX/6PBrRNtzjC6rQ0Gl0MN/erogFMCvHGI9gfF
    BkOzoGqrWELCUvV5BiizkhvRpEK4YW2BzI/XolsWW1gtttmqOJiC2cJo6UXJpqakqxIwIs
    8bcD7GpDqISPzyFOIa2Ga/vPqf873UUD6g1hGqz8oQ9p48/ytHS5CEh/RcSEIGrpol2DrH
    6wED6MbxOsSxo5qHTy3DjNvG9D1ESABJOX1YgrTau1f828XznckthGzgOJFm/VJerZ2KRh
    6MYj74k9l/GCR+f5kepX73FH4E4lIhikDx1yVrlQzT8cnR6Qg4t5bOfaxDulRH3zgGGY4Z
    qdQmvzP+L8MZyiqj1/viBgy3hq0FbbB6zuhmk/7mOIITFHjCVIvKwV4Ure2tXfpUiyk69M
    CGKgSuV5whQWF3SlRMam8TUpON6jdVgzZuAWsTJey+xSYXzXSA2Iq4fqo0AxIGV0kOHTsK
    ob0JPKE7vP38iddd4Xe8UTkkvVRsKIVtBc6I5J3qyAKvUkmBRHB6Y1Gu/TUw
X-ME-Proxy: <xmx:L0B8aknapWHNDYy-lykpU4VpX1VcEj89pCqPIQaPLFiymg_lcb9N7A>
    <xmx:L0B8as58dnhA0EYKPuIKa9qT1EC1Vm4a6-u9viGmkFHx-8KrxnWK9w>
    <xmx:L0B8aruU6HSOJVMjWMxP2KhRI-FCaGW8ITLPtuwTxIN5nJoVTBFyQw>
    <xmx:L0B8asXU7SM92QV2sioCS1CcbdVP6W0K_T8oxC3ZutGfPjSUyh5Ptw>
    <xmx:L0B8asX937CmQv-iufcxbRbnjgnUzebdvMbfh13BSfUvG4TzdGZYsrV2>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Aug 2026 05:43:04 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	alchark@flipper.net,
	chaoyi.chen@rock-chips.com,
	diederik@cknow-tech.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [PATCH v7 10/10] arm64: dts: rockchip: rk3576-rock-4d: enable NPU
Date: Wed, 12 Aug 2026 21:41:05 +1200
Message-ID: <20260812094106.1391698-11-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812094106.1391698-1-gahing@gahingwoo.com>
References: <20260812094106.1391698-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_104317_964655_C7B4071E 
X-CRM114-Status: GOOD (  10.23  )
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

Enable rknn_core_0 and its IOMMU on the Radxa ROCK 4D and supply the
core from vdd_npu_s0.

The supply is marked always-on because the NPU power domains are what
gate the block here, and dropping the rail underneath them takes an
async SError on the next power-on rather than a clean retry. Only
rknn_core_0 is enabled: the driver binds one core per node and the
second core is left to whoever can test it.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
index 272af1012..965e0906b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
@@ -442,6 +442,7 @@ regulator-state-mem {
 			};
 
 			vdd_npu_s0: dcdc-reg2 {
+				regulator-always-on;
 				regulator-boot-on;
 				regulator-enable-ramp-delay = <400>;
 				regulator-min-microvolt = <550000>;
@@ -869,3 +870,12 @@ vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi_in_vp0>;
 	};
 };
+
+&rknn_core_0 {
+	npu-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_0 {
+	status = "okay";
+};
-- 
2.43.0


