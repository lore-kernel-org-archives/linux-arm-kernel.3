Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0CBCD98E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 07:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=xmfQ0B4mSuUz0qzwmeF8cNt6KjZ0N5hpb3HAjnabsW8=; b=LErBzPYI+37ioMtqMlk/9nnKkS
	R2tY8NAUKer+sk0+33GTT49PIEx3E8ET1iT4Ccf/yU/GgN7iXlEHETzibArrPa/9CRWB7OQMQFfR4
	cpPSZzKVR3rQzMqtY3NLWACjIZZv6NG8qaphFnaDdGwMrSDslKVaHoMZeIP8nZ+/OAezhfe7eda7u
	Hzho2LSeRhujwkw0QAPtRW+tLcKSgbKeFurbbIu75/aVgV83hjH8Jwyn9Rf4hzWNjH3uAXNwEWCb2
	NNhSaIXGZO1q6K7q0REOFUVNe9l7AqvwI4IUp4oVivAIElq++HnBabehxk5A0IZh5CLzTMQKw0CqN
	CJplZj5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZNy2-0000000FM38-4626;
	Tue, 16 Jun 2026 07:12:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZNxy-0000000FM0q-1zHk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 07:12:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3457460137;
	Tue, 16 Jun 2026 07:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12C481F00A3A;
	Tue, 16 Jun 2026 07:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781593928;
	bh=xmfQ0B4mSuUz0qzwmeF8cNt6KjZ0N5hpb3HAjnabsW8=;
	h=Subject:To:Cc:From:Date:In-Reply-To;
	b=adabKzK66QkTZp8HYktsjJ3I1e5pvGTaMc8GNLaSzo2yawQv8EX2Iu9HB9g5BNGI0
	 RcmkyqDVzYEdFPcSpn0k48RbQTdXcqng5SBQckEqjRO+661QGN7brxHsgRihGG4hrl
	 W/juEyrAyjqf3OZJ9o8nt9FotAh2ns+SYxmUoduY=
Subject: Patch "arm64/mm: Enable batched TLB flush in unmap_hotplug_range()" has been added to the 5.10-stable tree
To: anshuman.khandual@arm.com,catalin.marinas@arm.com,david@kernel.org,gregkh@linuxfoundation.org,linux-arm-kernel@lists.infradead.org,ryan.roberts@arm.com,sashal@kernel.org,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 16 Jun 2026 12:40:41 +0530
In-Reply-To: <20260428200548.3191346-1-sashal@kernel.org>
Message-ID: <2026061641-pungent-mustard-6f0b@gregkh>
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

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm64-mm-enable-batched-tlb-flush-in-unmap_hotplug_range.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-241768-greg=kroah.com@vger.kernel.org Wed Apr 29 01:35:55 2026
From: Sasha Levin <sashal@kernel.org>
Date: Tue, 28 Apr 2026 16:05:48 -0400
Subject: arm64/mm: Enable batched TLB flush in unmap_hotplug_range()
To: stable@vger.kernel.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "David Hildenbrand (Arm)" <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Sasha Levin <sashal@kernel.org>
Message-ID: <20260428200548.3191346-1-sashal@kernel.org>

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
[ renamed `__pte_clear()` to `pte_clear()` and inlined `pmd_cont(pmd)` as `pmd_val(pmd) & PMD_SECT_CONT` ]
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/mm/mmu.c |   36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -862,10 +862,14 @@ static void unmap_hotplug_pte_range(pmd_
 
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
 
@@ -886,15 +890,14 @@ static void unmap_hotplug_pmd_range(pud_
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
+				WARN_ON(pmd_val(pmd) & PMD_SECT_CONT);
+				flush_tlb_kernel_range(addr, addr + PMD_SIZE);
 				free_hotplug_page_range(pmd_page(pmd),
 							PMD_SIZE, altmap);
+			}
+			/* unmap_hotplug_range() flushes TLB for !free_mapped */
 			continue;
 		}
 		WARN_ON(!pmd_table(pmd));
@@ -919,15 +922,12 @@ static void unmap_hotplug_pud_range(p4d_
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
@@ -957,6 +957,7 @@ static void unmap_hotplug_p4d_range(pgd_
 static void unmap_hotplug_range(unsigned long addr, unsigned long end,
 				bool free_mapped, struct vmem_altmap *altmap)
 {
+	unsigned long start = addr;
 	unsigned long next;
 	pgd_t *pgdp, pgd;
 
@@ -978,6 +979,9 @@ static void unmap_hotplug_range(unsigned
 		WARN_ON(!pgd_present(pgd));
 		unmap_hotplug_p4d_range(pgdp, addr, next, free_mapped, altmap);
 	} while (addr = next, addr < end);
+
+	if (!free_mapped)
+		flush_tlb_kernel_range(start, end);
 }
 
 static void free_empty_pte_table(pmd_t *pmdp, unsigned long addr,


Patches currently in stable-queue which might be from sashal@kernel.org are

queue-5.10/team-move-team-device-type-change-at-the-end-of-team.patch
queue-5.10/netfilter-nft_fib-fix-stale-stack-leak-via-the-oifname-register.patch
queue-5.10/asoc-intel-bytcht_es8316-fix-mclk-leak-on-init-error.patch
queue-5.10/spi-sun4i-fix-controller-deregistration.patch
queue-5.10/bluetooth-l2cap-fix-possible-crash-on-l2cap_ecred_co.patch
queue-5.10/ice-fix-vf-queue-configuration-with-low-mtu-values.patch
queue-5.10/ipv6-sit-reload-inner-ipv6-header-after-gso-offloads.patch
queue-5.10/ktest-fixing-indentation-to-match-expected-pattern.patch
queue-5.10/6lowpan-fix-off-by-one-in-multicast-context-address-.patch
queue-5.10/spi-meson-spicc-fix-double-put-in-remove-path.patch
queue-5.10/sctp-fix-race-between-sctp_wait_for_connect-and-peel.patch
queue-5.10/pcnet32-stop-holding-device-spin-lock-during-napi_co.patch
queue-5.10/mptcp-do-not-drop-partial-packets.patch
queue-5.10/bluetooth-hci_core-fix-use-after-free-in-vhci_flush.patch
queue-5.10/serial-qcom-geni-fix-uart_rx_par_en-bit-position.patch
queue-5.10/arm64-tlb-optimize-arm64_workaround_repeat_tlbi.patch
queue-5.10/nfc-llcp-fix-use-after-free-race-in-nfc_llcp_recv_cc.patch
queue-5.10/octeontx2-pf-avoid-double-free-of-pool-stack-on-aq-init-failure.patch
queue-5.10/net-hsr-defer-node-table-free-until-after-rcu-readers.patch
queue-5.10/f2fs-fix-incorrect-file-address-mapping-when-inline-inode-is-unwritten.patch
queue-5.10/phy-tegra-xusb-fix-per-pad-high-speed-termination-calibration.patch
queue-5.10/net-netlink-fix-sending-unassigned-nsid-after-assign.patch
queue-5.10/net-qrtr-ns-free-the-node-during-ctrl_cmd_bye.patch
queue-5.10/dm-cache-policy-smq-check-allocation-under-invalidat.patch
queue-5.10/rdma-rxe-fix-double-free-in-rxe_srq_from_init.patch-26331
queue-5.10/spi-ti-qspi-fix-controller-deregistration.patch
queue-5.10/ipv6-rpl-fix-hdrlen-overflow-in-ipv6_rpl_srh_decompr.patch
queue-5.10/smb-client-use-fullsessionkey-for-aes-256-encryption-key-derivation.patch
queue-5.10/ieee802154-6lowpan-only-accept-ipv6-packets-in-lowpa.patch
queue-5.10/tun-free-page-on-short-frame-rejection-in-tun_xdp_on.patch
queue-5.10/usb-serial-mct_u232-fix-memory-corruption-with-small.patch
queue-5.10/ext4-validate-p_idx-bounds-in-ext4_ext_correct_index.patch
queue-5.10/spi-topcliff-pch-fix-controller-deregistration.patch
queue-5.10/spi-uniphier-fix-controller-deregistration.patch
queue-5.10/mtd-spi-nor-sst-fix-write-enable-before-aai-sequence.patch
queue-5.10/signal-clear-jobctl_pending_mask-for-caller-in-zap_o.patch
queue-5.10/spi-syncuacer-fix-controller-deregistration.patch
queue-5.10/alsa-aoa-i2sbus-clear-stale-prepared-state.patch
queue-5.10/sched-use-u64-for-bandwidth-ratio-calculations.patch
queue-5.10/spi-tegra20-sflash-fix-controller-deregistration.patch
queue-5.10/usb-typec-ucsi-check-if-power-role-change-actually-happened-before-handling.patch
queue-5.10/rdma-umem-fix-kernel-doc-warnings.patch
queue-5.10/revert-rdma-rxe-fix-double-free-in-rxe_srq_from_init.patch
queue-5.10/octeontx2-af-add-validation-for-lmac-type.patch
queue-5.10/can-ucan-fix-devres-lifetime.patch
queue-5.10/net-qrtr-fix-refcount-saturation-and-potential-uaf-i.patch
queue-5.10/spi-qup-switch-to-use-modern-name.patch
queue-5.10/media-rc-igorplugusb-heed-coherency-rules.patch
queue-5.10/bpf-free-reuseport-cbpf-prog-after-rcu-grace-period.patch
queue-5.10/net-qrtr-ns-change-servers-radix-tree-to-xarray.patch
queue-5.10/qed-fix-double-free-in-qed_cxt_tables_alloc.patch
queue-5.10/usb-typec-ucsi-don-t-update-power_supply-on-power-role-change-if-not-connected.patch
queue-5.10/media-rc-ttusbir-respect-dma-coherency-rules.patch
queue-5.10/wifi-mac80211-check-tdls-flag-in-ieee80211_tdls_oper.patch
queue-5.10/batman-adv-tt-fix-toctou-race-for-reported-vlans.patch
queue-5.10/tty-serial-qcom-geni-serial-remove-unused-symbols.patch
queue-5.10/tty-serial-qcom-geni-serial-align-define-values.patch
queue-5.10/bluetooth-fix-uaf-in-l2cap_sock_cleanup_listen-vs-l2cap_conn_del.patch
queue-5.10/time-fix-off-by-one-in-settimeofday-usec-validation.patch
queue-5.10/usb-serial-cypress_m8-fix-memory-corruption-with-sma.patch
queue-5.10/xfrm-policy-fix-use-after-free-on-inexact-bin-in-xfr.patch
queue-5.10/netlabel-validate-unlabeled-address-and-mask-attribu.patch
queue-5.10/can-ucan-fix-typos-in-comments.patch
queue-5.10/batman-adv-tp_meter-fix-race-condition-in-send-error.patch
queue-5.10/batman-adv-tt-avoid-empty-vlan-responses.patch
queue-5.10/net-qrtr-ns-limit-the-total-number-of-nodes.patch
queue-5.10/spi-zynq-qspi-fix-controller-deregistration.patch
queue-5.10/serial-altera_jtaguart-handle-uart_add_one_port-failures.patch
queue-5.10/thunderbolt-property-cap-recursion-depth-in-__tb_property_parse_dir.patch
queue-5.10/serial-dz-fix-bootconsole-handover-lockup.patch
queue-5.10/net-sched-revert-net-sched-restrict-conditions-for-a.patch
queue-5.10/octeontx2-af-cgx-add-bounds-check-to-cgx_speed_mbps-index.patch
queue-5.10/btrfs-fix-missing-last_unlink_trans-update-when-removing-a-directory.patch
queue-5.10/vxlan-do-not-reuse-cached-ip_hdr-value-after-skb_tun.patch
queue-5.10/udf-fix-partition-descriptor-append-bookkeeping.patch
queue-5.10/net-guard-timestamp-cmsgs-to-real-error-queue-skbs.patch
queue-5.10/batman-adv-tvlv-reject-oversized-tvlv-packets.patch
queue-5.10/xfrm-check-for-underflow-in-xfrm_state_mtu.patch
queue-5.10/rdma-umem-fix-truncation-for-block-sizes-4g.patch
queue-5.10/net-garp-fix-unsigned-integer-underflow-in-garp_pdu_.patch
queue-5.10/alsa-aloop-fix-peer-runtime-uaf-during-format-change-stop.patch
queue-5.10/hid-core-fix-size_t-specifier-in-hid_report_raw_even.patch
queue-5.10/rds-mark-snapshot-pages-dirty-in-rds_info_getsockopt.patch
queue-5.10/bluetooth-init-sk_peer_-on-bt_sock_alloc.patch
queue-5.10/serial-altera_jtaguart-use-platform_get_irq_optional-to-get-the-interrupt.patch
queue-5.10/net-sched-act_api-use-rcu-with-deferred-freeing-for-.patch
queue-5.10/bluetooth-6lowpan-check-skb_clone-return-value-in-se.patch
queue-5.10/batman-adv-v-stop-ogmv2-on-disabled-interface.patch
queue-5.10/nfc-llcp-protect-nfc_llcp_sock_unlink-calls.patch
queue-5.10/net-openvswitch-fix-possible-kfree_skb-of-err_ptr.patch
queue-5.10/smb-client-fix-smbdirect_recv_io-leak-in-smbd_negoti.patch
queue-5.10/arm64-tlb-flush-walk-cache-when-unsharing-pmd-tables.patch
queue-5.10/mptcp-pm-add_addr-rtx-fix-potential-data-race.patch
queue-5.10/spi-st-ssc4-fix-controller-deregistration.patch
queue-5.10/net-packet-fix-toctou-race-on-mmap-d-vnet_hdr-in-tpacket_snd.patch
queue-5.10/netfilter-nf_queue-hold-bridge-skb-dev-while-queued.patch
queue-5.10/drm-nouveau-fix-u32-overflow-in-pushbuf-reloc-bounds-check.patch
queue-5.10/ip6_vti-fix-incorrect-tunnel-matching-in-vti6_tnl_lo.patch
queue-5.10/btrfs-fix-btrfs_ioctl_space_info-slot_count-toctou-which-can-lead-to-info-leak.patch
queue-5.10/io_uring-prevent-opcode-speculation.patch
queue-5.10/wifi-brcmfmac-fix-potential-use-after-free-issue-when-stopping-watchdog-task.patch
queue-5.10/hid-pass-the-buffer-size-to-hid_report_raw_event.patch
queue-5.10/alsa-aoa-skip-devices-with-no-codecs-in-i2sbus_resume.patch
queue-5.10/printk-add-print_hex_dump_devel.patch
queue-5.10/dm-thin-fix-metadata-refcount-underflow.patch
queue-5.10/batman-adv-bla-avoid-null-ptr-deref-for-claim-via-dr.patch
queue-5.10/tracing-probes-limit-size-of-event-probe-to-3k.patch
queue-5.10/usb-serial-digi_acceleport-fix-memory-corruption-wit.patch
queue-5.10/mm-hugetlb_cma-round-up-per_node-before-logging-it.patch
queue-5.10/bluetooth-rfcomm-hold-listener-socket-in-rfcomm_conn.patch
queue-5.10/wifi-mwifiex-fix-use-after-free-in-mwifiex_adapter_cleanup.patch
queue-5.10/tracepoint-balance-regfunc-on-func_add-failure-in-tracepoint_add_func.patch
queue-5.10/batman-adv-iv-recover-ogm-scheduling-after-forward-p.patch
queue-5.10/net-sched-cls_fw-fix-null-dereference-of-old-filters.patch
queue-5.10/compiler-clang.h-add-__diag-infrastructure-for-clang.patch
queue-5.10/spi-qup-fix-error-pointer-deref-after-dma-setup-failure.patch
queue-5.10/net-netlink-don-t-set-nsid-on-local-notifications.patch
queue-5.10/smb-client-fix-oob-read-in-smb2_ioctl_query_info-query_info-path.patch
queue-5.10/alsa-core-fix-potential-data-race-at-fasync-handling.patch
queue-5.10/net-smc-do-not-re-initialize-smc-hashtables.patch
queue-5.10/batman-adv-tp_meter-avoid-role-confusion-in-tp_list.patch
queue-5.10/ipvs-clear-the-svc-scheduler-ptr-early-on-edit.patch
queue-5.10/bluetooth-l2cap-clear-chan-ident-on-ecred-reconfigur.patch
queue-5.10/tunnels-do-not-assume-transport-header-in-iptunnel_p.patch
queue-5.10/selftests-mptcp-drop-nanoseconds-width-specifier.patch
queue-5.10/net-802-mrp-fix-vector-attribute-parsing-in-mrp_pdu_.patch
queue-5.10/batman-adv-bla-avoid-double-decrement-of-bla.num_req.patch
queue-5.10/hfsplus-fix-uninit-value-by-validating-catalog-record-size.patch
queue-5.10/batman-adv-tvlv-abort-ogm-send-on-tvlv-append-failur.patch
queue-5.10/alsa-pcm-fix-wait-queue-list-corruption-in-snd_pcm_d.patch
queue-5.10/rdma-move-dma-block-iterator-logic-into-dedicated-files.patch
queue-5.10/dm-btree-improve-btree-residency.patch
queue-5.10/page_pool-fix-use-after-free-in-page_pool_recycle_in.patch
queue-5.10/fbcon-avoid-oob-font-access-if-console-rotation-fails.patch
queue-5.10/tun-free-page-on-build_skb-failure-in-tun_xdp_one.patch
queue-5.10/qed-use-the-bitmap-api-to-simplify-some-functions.patch
queue-5.10/hid-core-add-printk_ratelimited-variants-to-hid_warn.patch
queue-5.10/bluetooth-mgmt-validate-advertising-tlv-before-type-.patch
queue-5.10/usb-dwc3-move-guid-programming-after-phy-initialization.patch
queue-5.10/netfilter-synproxy-add-mutex-to-guard-hook-reference.patch
queue-5.10/net-remove-redundant-if-statements.patch
queue-5.10/tee-optee-prevent-use-after-free-when-the-client-exi.patch
queue-5.10/hv_netvsc-use-kmap_local_page-in-netvsc_copy_to_send_buf.patch
queue-5.10/disable-wattribute-alias-for-clang-23-and-newer.patch
queue-5.10/net-qrtr-ns-limit-the-maximum-number-of-lookups.patch
queue-5.10/net-sched-sch_sfb-replace-direct-dequeue-call-with-p.patch
queue-5.10/netfilter-x_tables-avoid-leaking-percpu-counter-poin.patch
queue-5.10/tunnels-load-network-headers-after-skb_cow-in-iptunn.patch
queue-5.10/netfilter-synproxy-refresh-tcphdr-after-skb_ensure_w.patch
queue-5.10/arm64-mm-enable-batched-tlb-flush-in-unmap_hotplug_range.patch
queue-5.10/alsa-aoa-use-guard-for-mutex-locks.patch
queue-5.10/bluetooth-hci_event-fix-potential-uaf-in-ssp-passkey-handlers.patch
queue-5.10/bluetooth-consolidate-code-around-sk_alloc-into-a-helper-function.patch
queue-5.10/kvm-arm64-remove-vpipt-i-cache-handling.patch
queue-5.10/xhci-tegra-fix-ghost-usb-device-on-dual-role-port-un.patch
queue-5.10/netfilter-nft_exthdr-fix-register-tracking-for-f_pre.patch
queue-5.10/net-iucv-fix-locking-in-.getsockopt.patch
queue-5.10/sctp-purge-outqueue-on-stale-cookie-echo-handling.patch
queue-5.10/ipv4-restrict-ipopt_ssrr-and-ipopt_lsrr-options.patch
queue-5.10/netfilter-xt_cpu-prefer-raw_smp_processor_id.patch
queue-5.10/bluetooth-hci_qca-convert-timeout-from-jiffies-to-ms.patch
queue-5.10/spi-lantiq-ssc-fix-controller-deregistration.patch
queue-5.10/erofs-fix-the-out-of-bounds-nameoff-handling-for-trailing-dirents.patch
queue-5.10/smb-client-require-a-full-nfs-mode-sid-before-reading-mode-bits.patch
queue-5.10/phy-renesas-rcar-gen3-usb2-fix-the-use-of-msleep-dur.patch
queue-5.10/bonding-limit-bond_mode_8023ad-to-ethernet-devices.patch
queue-5.10/scsi-target-iscsi-bound-iscsi_encode_text_output-appends-to-rsp_buf.patch
queue-5.10/spi-sun6i-fix-controller-deregistration.patch
queue-5.10/netfilter-ebtables-fix-oob-read-in-compat_mtw_from_u.patch
queue-5.10/phy-tegra-xusb-disable-trk-clk-when-not-in-use.patch
queue-5.10/ceph-only-d_add-negative-dentries-when-they-are-unhashed.patch
queue-5.10/octeontx2-af-replace-deprecated-strncpy-with-strscpy.patch
queue-5.10/tap-free-page-on-error-paths-in-tap_get_user_xdp.patch
queue-5.10/nfc-nxp-nci-i2c-use-rising-edge-irq-on-acpi-systems.patch
queue-5.10/ktest-fix-the-month-in-the-name-of-the-failure-directory.patch
queue-5.10/pmdomain-core-fix-detach-procedure-for-virtual-devices-in-genpd.patch
queue-5.10/scsi-target-iscsi-fix-crc-overread-and-double-free-in-iscsit_handle_text_cmd.patch
queue-5.10/mm-huge_memory-update-file-pmd-counter-before-folio_put.patch
queue-5.10/net-bridge-use-a-stable-fdb-dst-snapshot-in-rcu-readers.patch
queue-5.10/f2fs-fix-uaf-caused-by-decrementing-sbi-nr_pages-in-f2fs_write_end_io.patch
queue-5.10/thermal-core-fix-thermal-zone-governor-cleanup-issues.patch
queue-5.10/net-lan743x-permit-vlan-tagged-packets-up-to-configu.patch
queue-5.10/drm-imx-fix-three-kernel-doc-warnings-in-dcss-scaler.patch
queue-5.10/usbnet-fix-using-smp_processor_id-in-preemptible-cod.patch
queue-5.10/spi-tegra114-fix-controller-deregistration.patch
queue-5.10/bluetooth-serialize-accept_q-access.patch
queue-5.10/crypto-caam-guard-hmac-key-hex-dumps-in-hash_digest_key.patch
queue-5.10/netfilter-bridge-make-ebt_snat-arp-rewrite-writable.patch
queue-5.10/acpi-scan-use-acpi_dev_put-in-object-add-error-paths.patch
queue-5.10/nfc-llcp-fix-use-after-free-in-llcp_sock_release.patch
queue-5.10/selftests-forwarding-lib-add-helpers-for-checksum-ha.patch
queue-5.10/alsa-usb-audio-fix-null-pointer-dereference-on-point.patch
queue-5.10/hfsplus-fix-held-lock-freed-on-hfsplus_fill_super.patch
queue-5.10/netfilter-conntrack_irc-fix-possible-out-of-bounds-r.patch
queue-5.10/netfilter-xt_nfqueue-prefer-raw_smp_processor_id.patch
queue-5.10/use-less-confusing-names-for-iov_iter-direction-initializers.patch
queue-5.10/net-rds-fix-null-deref-in-rds_ib_send_cqe_handler-on.patch
queue-5.10/sctp-fix-uninit-value-in-__sctp_rcv_asconf_lookup.patch
queue-5.10/ipv4-free-net-ipv4.sysctl_local_reserved_ports-after.patch
queue-5.10/net-mvpp2-sync-rx-data-at-the-hardware-packet-offset.patch
queue-5.10/arm64-tlb-allow-xzr-argument-to-tlbi-ops.patch
queue-5.10/nfsd-don-t-ignore-the-return-code-of-svc_proc_regist.patch

