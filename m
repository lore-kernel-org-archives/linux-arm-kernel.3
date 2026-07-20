Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7A8C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 05:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ieFQW3xe2YYYDcYZo+2gysoiQSrGYoM9MEjQ+nrFpOg=; b=2IjS8pu61RfhuApXvzKAgn7W/C
	pE2RGRgHxXFQtot0+rU1tA3sRu0CR51Zv4QKQi4+PI4OfCh20Agyq3fs5P5jPYbARo2gcFAlacnXn
	FM7AsThXCFlW1yDbGIJDVNfv60VpXSyAWACk46jrvJdZcg25pe9DukARzgP35LaMMW+ZXHnfboObg
	u99DmMB0SW6CVY706NGBXeZAwTMEFPhb38JFOXiColh5CY11vX457shvi1LgP8xjx/QJY2mKQ0PN8
	8viZ0P5AZ6aNjUJBR9OT2wrCIikUeUJilOHhqDBvB6ggufpucbAcIilFzD/0rdBadT6qLWxs1dHII
	60MfeF4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlgik-00000005s1j-0aQv;
	Mon, 20 Jul 2026 05:39:18 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlgiW-00000005ruG-0QDf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 05:39:07 +0000
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 66K5c7ou075973
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 20 Jul 2026 14:38:28 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=ieFQW3xe2YYYDcYZo+2gysoiQSrGYoM9MEjQ+nrFpOg=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1784525909; v=1;
        b=AZH0nuF/xXQaSP46dM8HH0MZuKjJeAaUaaLl83y8jHsvOO6qDlwtf97xkLV6DbnN
         OX+5w3p1K2tj8MMwz8cVtKWD8w90P+22cS7CZMIZ2/PFsoZTjf6lBjPyAgwKD6Nu
         UmN3n3lSV3YbSNU1fHpnGchMu89JPetp4+9wFrolKvroAmFZ2ozpkXrFdZhV/Pr8
         fV3O0YtthXdPE7wQRwXU5jmK7KszqgvUpCspETi7Iyb3OAM16VQbX4uXUXwTbkf+
         DsL6fuSG6j4XPSachvWDDGdJqNqx7fhKRyLNWWvB6/M4oyR/vnGtSa7ozWKoZey6
         6dJoDjigTDDYVtiac9Q5GA==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 20 Jul 2026 14:38:06 +0900
Subject: [PATCH v9 12/16] KVM: arm64: PMU: Pass the pPMU to
 kvm_map_pmu_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-hybrid-v9-12-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Steffen Eiden <seiden@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.16-dev-925f5
X-Developer-Signature: v=1; a=openpgp-sha256; l=1455;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=nDU8HixdRK1d+2i2v52T+AZ6ha5pTl2G+ZCt/ZW0yyI=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ1bsFh8vq4BJpRNjM/9+n1184c2Pm9Pue6hynNdcUKfyp
 n32CWWrjlIWBjEuBlkxRZaUot3cGtG1nwoT4ltg5rAygQxh4OIUgIkIszAyvEhaL5L38Dr30hvn
 BIw/d3v8XGnSnPB3Kyvvlkmz/8mc/MbIcN3BuLRCqfuH4nfH98eOz1J7O41p6b7yiD37Hr7g6JO
 6zQgA
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_223904_431840_A0DE444C 
X-CRM114-Status: GOOD (  12.37  )
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

Replace the VM argument with the pPMU used for event creation. The
current caller still passes the VM's default pPMU, but this removes the
implicit lookup from kvm_map_pmu_event() so later changes can map events
against the pPMU selected for an individual vCPU.

Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 arch/arm64/kvm/pmu-emul.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index c5c505b6fc61..27db8877f96e 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -670,10 +670,8 @@ static bool kvm_pmc_counts_at_el2(struct kvm_pmc *pmc)
 	return kvm_pmc_read_evtreg(pmc) & ARMV8_PMU_INCLUDE_EL2;
 }
 
-static int kvm_map_pmu_event(struct kvm *kvm, unsigned int eventsel)
+static int kvm_map_pmu_event(struct arm_pmu *pmu, unsigned int eventsel)
 {
-	struct arm_pmu *pmu = kvm->arch.arm_pmu;
-
 	/*
 	 * The CPU PMU likely isn't PMUv3; let the driver provide a mapping
 	 * for the guest's PMUv3 event ID.
@@ -725,7 +723,7 @@ static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
 	 * Don't create an event if we're running on hardware that requires
 	 * PMUv3 event translation and we couldn't find a valid mapping.
 	 */
-	eventsel = kvm_map_pmu_event(vcpu->kvm, eventsel);
+	eventsel = kvm_map_pmu_event(vcpu->kvm->arch.arm_pmu, eventsel);
 	if (eventsel < 0)
 		return;
 

-- 
2.55.0


