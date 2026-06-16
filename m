Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5724BCD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 05:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=xbJzuHH5hYnsWt27euYYhAgh6I89idHnIBjsYCqeuBs=; b=hwRPiivhtw/JtaEAayVayPgjlT
	Syk8yrzj+MOtc1RjtNi0vnOw8iZhf+PPnyPmxne69nV5BB2ea3xwT0BBAPSu1zdLqQ1Jii0Ag1RAc
	iwrAngee+NzBmPOjwZyJoCRy68Cf9MtmKT7VYcDScC/MArkGEOjlO+Pce1y9+j2WzqUQ/k8vLqpjy
	Vr6vRilkhLhfTwynyYXNZfgPKS1JOQcvNu28X5Gtj3uW37c/BAZS1Xt6CXfS71HECalbbtQ1e9ASD
	vkwhde2XyQqcjPKK4Bkj56+BKp+w2KdA34PRY6x3sIFjPIgejjgxtO7ACinPSwYjJZJIH0Ii9xyWG
	NiFwV2QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMVW-0000000FFdI-2hna;
	Tue, 16 Jun 2026 05:38:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMVV-0000000FFdB-0r2n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 05:38:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 79E2440203;
	Tue, 16 Jun 2026 05:38:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86BB71F00A3D;
	Tue, 16 Jun 2026 05:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781588320;
	bh=xbJzuHH5hYnsWt27euYYhAgh6I89idHnIBjsYCqeuBs=;
	h=Subject:To:Cc:From:Date:In-Reply-To;
	b=G6romRQ2qNXSdWMS29031sDAGcombNRs6bYQ+yXSYxF7Lab4xYhn3mmliTNX05qZV
	 sHzV3z9YXVYeXEefU+gF6FM2oUyTGJ21ddI4m+96bULfgvkx2ShRi9kVLxZo20fgfP
	 a42iTrASHVOv7DMjTYJJqBEz4CeH+fTrfBzqqPXE=
Subject: Patch "arm64/mm: Enable batched TLB flush in unmap_hotplug_range()" has been added to the 5.15-stable tree
To: anshuman.khandual@arm.com,catalin.marinas@arm.com,david@kernel.org,gregkh@linuxfoundation.org,linux-arm-kernel@lists.infradead.org,ryan.roberts@arm.com,sashal@kernel.org,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 16 Jun 2026 11:02:03 +0530
In-Reply-To: <20260428185311.3151505-1-sashal@kernel.org>
Message-ID: <2026061603-deduct-decaf-d039@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore
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


This is a note to let you know that I've just added the patch titled

    arm64/mm: Enable batched TLB flush in unmap_hotplug_range()

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm64-mm-enable-batched-tlb-flush-in-unmap_hotplug_range.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-241760-greg=kroah.com@vger.kernel.org Wed Apr 29 00:24:42 2026
From: Sasha Levin <sashal@kernel.org>
Date: Tue, 28 Apr 2026 14:53:11 -0400
Subject: arm64/mm: Enable batched TLB flush in unmap_hotplug_range()
To: stable@vger.kernel.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "David Hildenbrand (Arm)" <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Sasha Levin <sashal@kernel.org>
Message-ID: <20260428185311.3151505-1-sashal@kernel.org>

From: Anshuman Khandual <anshuman.khandual@arm.com>

[ Upstream commit 48478b9f791376b4b89018d7afdfd06865498f65 ]

During a memory hot remove operation, both linear and vmemmap mappings for
the memory range being removed, get unmapped via unmap_hotplug_range() but
mapped pages get freed only for vmemmap mapping. This is just a sequential
operation where each table entry gets cleared, followed by a leaf specific
TLB flush, and then followed by memory free operation when applicable.

This approach was simple and uniform both for vmemmap and linear mappings.
But linear mapping might contain CONT marked block memory where it becomes
necessary to first clear out all entire in the range before a TLB flush.
This is as per the architecture requirement. Hence batch all TLB flushes
during the table tear down walk and finally do it in unmap_hotplug_range().

Prior to this fix, it was hypothetically possible for a speculative access
to a higher address in the contiguous block to fill the TLB with shattered
entries for the entire contiguous range after a lower address had already
been cleared and invalidated. Due to the table entries being shattered, the
subsequent TLB invalidation for the higher address would not then clear the
TLB entries for the lower address, meaning stale TLB entries could persist.

Besides it also helps in improving the performance via TLBI range operation
along with reduced synchronization instructions. The time spent executing
unmap_hotplug_range() improved 97% measured over a 2GB memory hot removal
in KVM guest.

This scheme is not applicable during vmemmap mapping tear down where memory
needs to be freed and hence a TLB flush is required after clearing out page
table entry.

Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Closes: https://lore.kernel.org/all/aWZYXhrT6D2M-7-N@willie-the-truck/
Fixes: bbd6ec605c0f ("arm64/mm: Enable memory hot remove")
Cc: stable@vger.kernel.org
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
[ replaced `__pte_clear()` with `pte_clear()` ]
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/mm/mmu.c |   36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -886,10 +886,14 @@ static void unmap_hotplug_pte_range(pmd_
 
 		WARN_ON(!pte_present(pte));
 		pte_clear(&init_mm, addr, ptep);
-		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
-		if (free_mapped)
+		if (free_mapped) {
+			/* CONT blocks are not supported in the vmemmap */
+			WARN_ON(pte_cont(pte));
+			flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
 			free_hotplug_page_range(pte_page(pte),
 						PAGE_SIZE, altmap);
+		}
+		/* unmap_hotplug_range() flushes TLB for !free_mapped */
 	} while (addr += PAGE_SIZE, addr < end);
 }
 
@@ -910,15 +914,14 @@ static void unmap_hotplug_pmd_range(pud_
 		WARN_ON(!pmd_present(pmd));
 		if (pmd_sect(pmd)) {
 			pmd_clear(pmdp);
-
-			/*
-			 * One TLBI should be sufficient here as the PMD_SIZE
-			 * range is mapped with a single block entry.
-			 */
-			flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
-			if (free_mapped)
+			if (free_mapped) {
+				/* CONT blocks are not supported in the vmemmap */
+				WARN_ON(pmd_cont(pmd));
+				flush_tlb_kernel_range(addr, addr + PMD_SIZE);
 				free_hotplug_page_range(pmd_page(pmd),
 							PMD_SIZE, altmap);
+			}
+			/* unmap_hotplug_range() flushes TLB for !free_mapped */
 			continue;
 		}
 		WARN_ON(!pmd_table(pmd));
@@ -943,15 +946,12 @@ static void unmap_hotplug_pud_range(p4d_
 		WARN_ON(!pud_present(pud));
 		if (pud_sect(pud)) {
 			pud_clear(pudp);
-
-			/*
-			 * One TLBI should be sufficient here as the PUD_SIZE
-			 * range is mapped with a single block entry.
-			 */
-			flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
-			if (free_mapped)
+			if (free_mapped) {
+				flush_tlb_kernel_range(addr, addr + PUD_SIZE);
 				free_hotplug_page_range(pud_page(pud),
 							PUD_SIZE, altmap);
+			}
+			/* unmap_hotplug_range() flushes TLB for !free_mapped */
 			continue;
 		}
 		WARN_ON(!pud_table(pud));
@@ -981,6 +981,7 @@ static void unmap_hotplug_p4d_range(pgd_
 static void unmap_hotplug_range(unsigned long addr, unsigned long end,
 				bool free_mapped, struct vmem_altmap *altmap)
 {
+	unsigned long start = addr;
 	unsigned long next;
 	pgd_t *pgdp, pgd;
 
@@ -1002,6 +1003,9 @@ static void unmap_hotplug_range(unsigned
 		WARN_ON(!pgd_present(pgd));
 		unmap_hotplug_p4d_range(pgdp, addr, next, free_mapped, altmap);
 	} while (addr = next, addr < end);
+
+	if (!free_mapped)
+		flush_tlb_kernel_range(start, end);
 }
 
 static void free_empty_pte_table(pmd_t *pmdp, unsigned long addr,


Patches currently in stable-queue which might be from sashal@kernel.org are

queue-5.15/bonding-refuse-to-enslave-can-devices.patch
queue-5.15/asoc-intel-bytcht_es8316-fix-mclk-leak-on-init-error.patch
queue-5.15/asoc-codecs-simple-mux-fix-enum-control-bounds-check.patch
queue-5.15/bluetooth-l2cap-fix-possible-crash-on-l2cap_ecred_co.patch
queue-5.15/ipv6-sit-reload-inner-ipv6-header-after-gso-offloads.patch
queue-5.15/ethtool-eeprom-add-more-safeties-to-eeprom-netlink-f.patch
queue-5.15/6lowpan-fix-off-by-one-in-multicast-context-address-.patch
queue-5.15/randomize_kstack-maintain-kstack_offset-per-task.patch
queue-5.15/sctp-fix-race-between-sctp_wait_for_connect-and-peel.patch
queue-5.15/pcnet32-stop-holding-device-spin-lock-during-napi_co.patch
queue-5.15/drm-vc4-fix-krealloc-memory-leak.patch
queue-5.15/f2fs-fix-to-do-sanity-check-on-dcc-discard_cmd_cnt-conditionally.patch
queue-5.15/arm64-tlb-optimize-arm64_workaround_repeat_tlbi.patch
queue-5.15/nfc-llcp-fix-use-after-free-race-in-nfc_llcp_recv_cc.patch
queue-5.15/net-netlink-fix-sending-unassigned-nsid-after-assign.patch
queue-5.15/bluetooth-bnep-reject-short-frames-before-parsing.patch
queue-5.15/nvme-respect-nvme_quirk_disable_write_zeroes-when-wzsl-is-set.patch
queue-5.15/rtw88-8821ce-disable-pcie-aspm-l1-for-8821ce-using-chip-id.patch
queue-5.15/net-qrtr-ns-free-the-node-during-ctrl_cmd_bye.patch
queue-5.15/dm-cache-policy-smq-check-allocation-under-invalidat.patch
queue-5.15/crypto-nx-avoid-wflex-array-member-not-at-end-warning.patch
queue-5.15/drm-i915-psr-read-intel-dpcd-workaround-register.patch
queue-5.15/ipv6-rpl-fix-hdrlen-overflow-in-ipv6_rpl_srh_decompr.patch
queue-5.15/ieee802154-6lowpan-only-accept-ipv6-packets-in-lowpa.patch
queue-5.15/tun-free-page-on-short-frame-rejection-in-tun_xdp_on.patch
queue-5.15/usb-serial-mct_u232-fix-memory-corruption-with-small.patch
queue-5.15/ext4-validate-p_idx-bounds-in-ext4_ext_correct_index.patch
queue-5.15/wifi-rtw88-check-for-pci-upstream-bridge-existence.patch
queue-5.15/bluetooth-bnep-fix-incorrect-length-parsing-in-bnep_.patch
queue-5.15/mtd-spi-nor-sst-fix-write-enable-before-aai-sequence.patch
queue-5.15/signal-clear-jobctl_pending_mask-for-caller-in-zap_o.patch
queue-5.15/alsa-aoa-i2sbus-clear-stale-prepared-state.patch
queue-5.15/sched-use-u64-for-bandwidth-ratio-calculations.patch
queue-5.15/revert-rdma-rxe-fix-double-free-in-rxe_srq_from_init.patch
queue-5.15/can-ucan-fix-devres-lifetime.patch
queue-5.15/net-qrtr-fix-refcount-saturation-and-potential-uaf-i.patch
queue-5.15/media-rc-igorplugusb-heed-coherency-rules.patch
queue-5.15/bpf-free-reuseport-cbpf-prog-after-rcu-grace-period.patch
queue-5.15/net-qrtr-ns-change-servers-radix-tree-to-xarray.patch
queue-5.15/net-mctp-ensure-our-nlmsg-responses-are-initialised.patch
queue-5.15/media-rc-ttusbir-respect-dma-coherency-rules.patch
queue-5.15/batman-adv-tt-fix-toctou-race-for-reported-vlans.patch
queue-5.15/nvme-fix-interpretation-of-dmrsl.patch
queue-5.15/time-fix-off-by-one-in-settimeofday-usec-validation.patch
queue-5.15/usb-serial-cypress_m8-fix-memory-corruption-with-sma.patch
queue-5.15/crypto-nx-fix-bounce-buffer-leaks-in-nx842_crypto_-alloc-free-_ctx.patch
queue-5.15/xfrm-policy-fix-use-after-free-on-inexact-bin-in-xfr.patch
queue-5.15/netlabel-validate-unlabeled-address-and-mask-attribu.patch
queue-5.15/can-ucan-fix-typos-in-comments.patch
queue-5.15/batman-adv-tt-avoid-empty-vlan-responses.patch
queue-5.15/drm-remove-plane-hsub-vsub-alignment-requirement-for.patch
queue-5.15/net-qrtr-ns-limit-the-total-number-of-nodes.patch
queue-5.15/scsi-sd-fix-missing-put_disk-when-device_add-disk_dev-fails.patch
queue-5.15/serial-dz-fix-bootconsole-handover-lockup.patch
queue-5.15/net-sched-revert-net-sched-restrict-conditions-for-a.patch
queue-5.15/drm-i915-psr-add-defininitions-for-intel_wa_register.patch
queue-5.15/net-mvpp2-limit-xdp-frame-size-to-the-rx-buffer.patch
queue-5.15/vxlan-do-not-reuse-cached-ip_hdr-value-after-skb_tun.patch
queue-5.15/udf-fix-partition-descriptor-append-bookkeeping.patch
queue-5.15/scsi-sd-add-error-handling-support-for-add_disk.patch
queue-5.15/net-guard-timestamp-cmsgs-to-real-error-queue-skbs.patch
queue-5.15/batman-adv-tvlv-reject-oversized-tvlv-packets.patch
queue-5.15/net-mvpp2-add-metadata-support-for-xdp-mode.patch
queue-5.15/net-mctp-fix-don-t-require-received-header-reserved-bits-to-be-zero.patch
queue-5.15/xfrm-check-for-underflow-in-xfrm_state_mtu.patch
queue-5.15/net-garp-fix-unsigned-integer-underflow-in-garp_pdu_.patch
queue-5.15/alsa-aloop-fix-peer-runtime-uaf-during-format-change-stop.patch
queue-5.15/hid-core-fix-size_t-specifier-in-hid_report_raw_even.patch
queue-5.15/rds-mark-snapshot-pages-dirty-in-rds_info_getsockopt.patch
queue-5.15/net-sched-act_api-use-rcu-with-deferred-freeing-for-.patch
queue-5.15/wifi-brcmfmac-fix-use-after-free-when-rescheduling-b.patch
queue-5.15/bluetooth-6lowpan-check-skb_clone-return-value-in-se.patch
queue-5.15/mtd-docg3-fix-use-after-free-in-docg3_release.patch
queue-5.15/batman-adv-v-stop-ogmv2-on-disabled-interface.patch
queue-5.15/net-openvswitch-fix-possible-kfree_skb-of-err_ptr.patch
queue-5.15/smb-client-fix-smbdirect_recv_io-leak-in-smbd_negoti.patch
queue-5.15/fbdev-defio-disconnect-deferred-i-o-from-the-lifetime-of-struct-fb_info.patch
queue-5.15/net-packet-fix-toctou-race-on-mmap-d-vnet_hdr-in-tpacket_snd.patch
queue-5.15/ip6_vti-fix-incorrect-tunnel-matching-in-vti6_tnl_lo.patch
queue-5.15/gpio-rockchip-convert-bank-clk-to-devm_clk_get_enabl.patch
queue-5.15/hid-pass-the-buffer-size-to-hid_report_raw_event.patch
queue-5.15/smb-server-fix-active_num_conn-leak-on-transport-allocation-failure.patch
queue-5.15/alsa-aoa-skip-devices-with-no-codecs-in-i2sbus_resume.patch
queue-5.15/printk-add-print_hex_dump_devel.patch
queue-5.15/batman-adv-bla-avoid-null-ptr-deref-for-claim-via-dr.patch
queue-5.15/usb-serial-digi_acceleport-fix-memory-corruption-wit.patch
queue-5.15/bluetooth-rfcomm-hold-listener-socket-in-rfcomm_conn.patch
queue-5.15/wifi-mwifiex-fix-use-after-free-in-mwifiex_adapter_cleanup.patch
queue-5.15/tracepoint-balance-regfunc-on-func_add-failure-in-tracepoint_add_func.patch
queue-5.15/batman-adv-iv-recover-ogm-scheduling-after-forward-p.patch
queue-5.15/net-sched-cls_fw-fix-null-dereference-of-old-filters.patch
queue-5.15/compiler-clang.h-add-__diag-infrastructure-for-clang.patch
queue-5.15/net-netlink-don-t-set-nsid-on-local-notifications.patch
queue-5.15/smb-client-fix-oob-read-in-smb2_ioctl_query_info-query_info-path.patch
queue-5.15/batman-adv-tp_meter-directly-shut-down-timer-on-clea.patch
queue-5.15/netfilter-nf_log-validate-mac-header-was-set-before-.patch
queue-5.15/alsa-core-fix-potential-data-race-at-fasync-handling.patch
queue-5.15/net-smc-do-not-re-initialize-smc-hashtables.patch
queue-5.15/ipvs-clear-the-svc-scheduler-ptr-early-on-edit.patch
queue-5.15/bluetooth-l2cap-clear-chan-ident-on-ecred-reconfigur.patch
queue-5.15/tunnels-do-not-assume-transport-header-in-iptunnel_p.patch
queue-5.15/phy-mscc-use-phy_id_match_vendor-to-minimize-phy-id-.patch
queue-5.15/net-802-mrp-fix-vector-attribute-parsing-in-mrp_pdu_.patch
queue-5.15/batman-adv-bla-avoid-double-decrement-of-bla.num_req.patch
queue-5.15/hfsplus-fix-uninit-value-by-validating-catalog-record-size.patch
queue-5.15/batman-adv-tvlv-abort-ogm-send-on-tvlv-append-failur.patch
queue-5.15/net-mvpp2-refill-rx-buffers-before-xdp-or-skb-use.patch
queue-5.15/mtd-docg3-convert-to-platform-remove-callback-returning-void.patch
queue-5.15/scsi-core-pm-rely-on-the-device-driver-core-for-async-power-management.patch
queue-5.15/tun-free-page-on-build_skb-failure-in-tun_xdp_one.patch
queue-5.15/net-mvpp2-build-skb-from-xdp-adjusted-data-on-xdp_pa.patch
queue-5.15/bluetooth-fix-memory-leak-in-error-path-of-hci_alloc.patch
queue-5.15/hid-core-add-printk_ratelimited-variants-to-hid_warn.patch
queue-5.15/bluetooth-mgmt-validate-advertising-tlv-before-type-.patch
queue-5.15/mm-damon-ops-common-call-folio_test_lru-after-folio_.patch
queue-5.15/mmc-sdhci-of-dwcmshc-disable-clock-before-dll-configuration.patch
queue-5.15/netfilter-synproxy-add-mutex-to-guard-hook-reference.patch
queue-5.15/drm-dp-add-edp-1.5-bit-definition.patch
queue-5.15/dmaengine-idxd-fix-not-releasing-workqueue-on-.relea.patch
queue-5.15/tee-optee-prevent-use-after-free-when-the-client-exi.patch
queue-5.15/disable-wattribute-alias-for-clang-23-and-newer.patch
queue-5.15/net-qrtr-ns-limit-the-maximum-number-of-lookups.patch
queue-5.15/net-sched-sch_sfb-replace-direct-dequeue-call-with-p.patch
queue-5.15/netfilter-x_tables-avoid-leaking-percpu-counter-poin.patch
queue-5.15/tunnels-load-network-headers-after-skb_cow-in-iptunn.patch
queue-5.15/netfilter-synproxy-refresh-tcphdr-after-skb_ensure_w.patch
queue-5.15/arm64-mm-enable-batched-tlb-flush-in-unmap_hotplug_range.patch
queue-5.15/alsa-aoa-use-guard-for-mutex-locks.patch
queue-5.15/bluetooth-hci_event-fix-potential-uaf-in-ssp-passkey-handlers.patch
queue-5.15/kvm-arm64-remove-vpipt-i-cache-handling.patch
queue-5.15/xhci-tegra-fix-ghost-usb-device-on-dual-role-port-un.patch
queue-5.15/netfilter-nft_exthdr-fix-register-tracking-for-f_pre.patch
queue-5.15/net-cpsw_new-fix-potential-unregister-of-netdev-that.patch
queue-5.15/smb-server-fix-max_connections-off-by-one-in-tcp-accept-path.patch
queue-5.15/drm-i915-psr-apply-intel-dpcd-workaround-when-sdp-on.patch
queue-5.15/net-iucv-fix-locking-in-.getsockopt.patch
queue-5.15/rdma-rxe-fix-double-free-in-rxe_srq_from_init.patch-82
queue-5.15/sctp-purge-outqueue-on-stale-cookie-echo-handling.patch
queue-5.15/ipv4-restrict-ipopt_ssrr-and-ipopt_lsrr-options.patch
queue-5.15/netfilter-xt_cpu-prefer-raw_smp_processor_id.patch
queue-5.15/erofs-fix-the-out-of-bounds-nameoff-handling-for-trailing-dirents.patch
queue-5.15/smb-client-require-a-full-nfs-mode-sid-before-reading-mode-bits.patch
queue-5.15/netfilter-ebtables-fix-oob-read-in-compat_mtw_from_u.patch
queue-5.15/ceph-only-d_add-negative-dentries-when-they-are-unhashed.patch
queue-5.15/tap-free-page-on-error-paths-in-tap_get_user_xdp.patch
queue-5.15/nfc-nxp-nci-i2c-use-rising-edge-irq-on-acpi-systems.patch
queue-5.15/bluetooth-rfcomm-validate-skb-length-in-mcc-handlers.patch
queue-5.15/net-bridge-use-a-stable-fdb-dst-snapshot-in-rcu-readers.patch
queue-5.15/fs-ntfs3-return-error-for-inconsistent-extended-attr.patch
queue-5.15/f2fs-fix-uaf-caused-by-decrementing-sbi-nr_pages-in-f2fs_write_end_io.patch
queue-5.15/thermal-core-fix-thermal-zone-governor-cleanup-issues.patch
queue-5.15/net-lan743x-permit-vlan-tagged-packets-up-to-configu.patch
queue-5.15/crypto-nx-migrate-to-scomp-api.patch
queue-5.15/drm-imx-fix-three-kernel-doc-warnings-in-dcss-scaler.patch
queue-5.15/sd-rename-the-scsi_disk.dev-field.patch
queue-5.15/crypto-caam-guard-hmac-key-hex-dumps-in-hash_digest_key.patch
queue-5.15/netfilter-bridge-make-ebt_snat-arp-rewrite-writable.patch
queue-5.15/nfc-llcp-fix-use-after-free-in-llcp_sock_release.patch
queue-5.15/selftests-forwarding-lib-add-helpers-for-checksum-ha.patch
queue-5.15/hfsplus-fix-held-lock-freed-on-hfsplus_fill_super.patch
queue-5.15/ksmbd-require-minimum-ace-size-in-smb_check_perm_dacl.patch
queue-5.15/netfilter-conntrack_irc-fix-possible-out-of-bounds-r.patch
queue-5.15/netfilter-xt_nfqueue-prefer-raw_smp_processor_id.patch
queue-5.15/phy-mscc-use-phy_id_match_exact-for-vsc8584-vsc8582-.patch
queue-5.15/net-rds-fix-null-deref-in-rds_ib_send_cqe_handler-on.patch
queue-5.15/erofs-fix-unsigned-underflow-in-z_erofs_lz4_handle_overlap.patch
queue-5.15/sctp-fix-uninit-value-in-__sctp_rcv_asconf_lookup.patch
queue-5.15/ipv4-free-net-ipv4.sysctl_local_reserved_ports-after.patch
queue-5.15/net-mvpp2-sync-rx-data-at-the-hardware-packet-offset.patch
queue-5.15/arm64-tlb-allow-xzr-argument-to-tlbi-ops.patch
queue-5.15/rxrpc-fix-conn-level-packet-handling-to-unshare-response-packets.patch
queue-5.15/nfsd-don-t-ignore-the-return-code-of-svc_proc_regist.patch

