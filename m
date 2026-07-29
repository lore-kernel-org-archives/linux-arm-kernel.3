Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A5CC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 13:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yn9Iiu4P2fYSytctn1Ql8E6oUHlGmLqwfTf+CFaazFc=; b=I3FoXzbA+xIlPrzPEjrhO+2+Xc
	IB4EK9oVu/Rl0f9udfcXd0otUPXVQG2+ovZjpr2/kIf8Y5qndFNpZ8wJzydgeJ5juDLiXrbXN8mRo
	KINMlF5ID3/OadX7vBEd3NPvT773Siuz1li1P0RA/zDjHVQn9BW0+H+ILwv67uLE/0Of/DwRItl3d
	9y+3FWR5jrMNbtf92ILuMkviCr2Q4B1FpnK9fnTDTM0teQmDw0QF+bLGHG1EeY4SUCCuyCJB442Cu
	jYenVDAIRVWVapKSWltDzQjUxlMSqRCJTnl8b4w+XlH6a2vmRIpH+bmYFnYIy7WGC+Q+YyqybFSVj
	vWvvdASw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4Xy-000000089Wa-12f5;
	Wed, 29 Jul 2026 13:42:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4Xw-000000089UX-1hPI
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Jul 2026 13:42:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yn9Iiu4P2fYSytctn1Ql8E6oUHlGmLqwfTf+CFaazFc=; b=k5Gb+at0rUsa7OUAOpj0qDbNgn
	fjmu3DKahezqhY3AK7qMWhDB2uAWX6DQTDP8PMx1Hf4dII/hY/MVf6Dz1kLq0g+EGDKj419pnyCAT
	x2rOkpYbJKqumdOD/qk2XsqVsKHBpS/40RU0FaZSGwJ0CLXr3Uf9aBEXyzNsct+hYE4DQ2woTe37/
	hfbteMIibh+U8sgmJS8IFkiK0TKWQxZbJrJdpBm9xm1Y/lYkpFlVWH2lxbnI3Fkxg2a6ANZ6MRaei
	bW9BARKeLTo1JRUvdrdsPe14xDFcx4le0yBwFtGTTOQUDiZUptn+xMy2Rl/X9sQ6/ZyU2Y1g9GNxI
	7GgGGpow==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wp4Xs-00000005rTo-1Qum
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 13:42:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23DF01688;
	Wed, 29 Jul 2026 06:41:58 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DBD83F86F;
	Wed, 29 Jul 2026 06:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785332522; bh=9z9NU4rclo/l5DJELjzybhVW3IFJ+hEU2wBrmc8WBMc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HTZZISDF/YdbiYrpf+au47eIaoXgWWS9Yo63IKEclbJJgw3lxAMdveefkq2C9KNGe
	 BwdDq1ijiJFjmFA4a0MdpqjbzO+IyOmSLH1maeI43BEj0VC0DSM2JdIkIR0lpD+Aop
	 561kWEYWDAtDlHg+m75zyT2iRcBVakr0rpDuWYtM=
From: Andre Przywara <andre.przywara@arm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
	Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Srinivas Ramana <sramana@qti.qualcomm.com>,
	Niyas Sait <niyas.sait@arm.com>,
	Lee Trager <lee@trager.us>,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 06/10] arm_mpam: propagate MSC access errors for state saving function
Date: Wed, 29 Jul 2026 15:41:20 +0200
Message-ID: <20260729134124.2506269-7-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729134124.2506269-1-andre.przywara@arm.com>
References: <20260729134124.2506269-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_144204_652313_2D3FC0A2 
X-CRM114-Status: GOOD (  10.45  )
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

Allow the mpam_save_mbwu_state() function to return an error, and
propagate read and write errors from the lower level up.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 44eafef1e7ab..9b6d266b4fa6 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1838,22 +1838,37 @@ static int mpam_save_mbwu_state(void *arg)
 
 		mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, i) |
 			  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
-		mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
-		mpam_read_monsel_reg(msc, CFG_MBWU_FLT, &cur_flt);
-		mpam_read_monsel_reg(msc, CFG_MBWU_CTL, &cur_ctl);
-		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
+		ret = mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
+		if (ret)
+			return ret;
+		ret = mpam_read_monsel_reg(msc, CFG_MBWU_FLT, &cur_flt);
+		if (ret)
+			return ret;
+		ret = mpam_read_monsel_reg(msc, CFG_MBWU_CTL, &cur_ctl);
+		if (ret)
+			return ret;
+		ret = mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
+		if (ret)
+			return ret;
 
 		if (mpam_ris_has_mbwu_long_counter(ris)) {
 			ret = mpam_msc_read_mbwu_l(msc, &val);
 			if (ret)
 				return ret;
-			mpam_msc_zero_mbwu_l(msc);
+			ret = mpam_msc_zero_mbwu_l(msc);
+			if (ret)
+				return ret;
 		} else {
 			u32 val32;
 
-			mpam_read_monsel_reg(msc, MBWU, &val32);
+			ret = mpam_read_monsel_reg(msc, MBWU, &val32);
+			if (ret)
+				return ret;
+
 			val = val32;
-			mpam_write_monsel_reg(msc, MBWU, 0);
+			ret = mpam_write_monsel_reg(msc, MBWU, 0);
+			if (ret)
+				return ret;
 		}
 
 		cfg->mon = i;
-- 
2.43.0


