Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9759ACA9EBB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 01:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=8omd+2bsZqJfTjrr/Zk69yQmoKtMkDPpX7BYeeILf/c=; b=QSBu0W29UWC20BLaQscGnzQdru
	/xVIc5foOgEQ/uv68fRLM6iz8ldunzaXaYnhTOnr/pquglT+u64n2+D9Z/cHu1wsP+PJWIF3t56Ns
	Q7mWkVZTExfca7PWsZ3Nv+l9mupc9PEUdEA8y29GQiofRFXuf2BtwgofpkVdvSZP3KHO24UjD9Urr
	puZa8rVxzTLMb6IK63esN77ciDOfY2h4VH6i3332Bj37tiL8USw75wXmTaXfPh+C27XTV4CY/OnXH
	v7k0KgRa3hEuGAcll4eDPRxyA/rQjHftSzGWkTJaP1rjRFE7c+9CNbhxi8hd40hy9tLrmiromfJU+
	9Y8NmzMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFMN3-00000007PFv-0GkY;
	Sat, 10 Oct 2026 01:59:33 +0000
Received: from mail-oi1-f200.google.com ([209.85.167.200])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFMN0-00000007PFb-0I11
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 01:59:31 +0000
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4f9b643ae53so368932b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 18:59:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791597568; x=1792202368;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8omd+2bsZqJfTjrr/Zk69yQmoKtMkDPpX7BYeeILf/c=;
        b=Wg002Swu5ga8Bf8gK7EaAWEdd1TdOdoPUuvrOBPlyeuXWVzRNSpuk7yYY02771/aSg
         xcNY1TiQi0aVH2LiBdewu8jXphVqdGdK7l5E61ekZphjk6HAlejEdkU4zAYkrNbH10hh
         HLPOpj9mNiU/FnW3lOVkcyuymLE+QMSOWHku6n9aiuBF3YDYvnuzhoQXRPpY17htHnTt
         tWD+8/PGfU79+Dd1ga2sq2lpWlIc5PmTN1uF5C6+dxoZWnHo7lfKjE1aL6MV+eBpj1EG
         6eNphFSPxcRU45HznNnelUJVQmruMqK0TEI7ciQQJLWazEFcZ8JoOLSUUTjD08pgo1AI
         KjvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvTim26OFz/qZTgaltL4lsaHQ3L13K88HwypH3Gmm4m/C9hZogZb8924Baj0jnOi2R/8AFKa92h4DfuaTHgppS@lists.infradead.org
X-Gm-Message-State: AFq9FYLlgCfkxRCvSh7Czm6LA4sE0Hx4KHQrspQlKZfPGe2t9qmT2xuq
	/k7t4IQ2Gy0UBRGWMMvEBLPnlXAhI5uQk7eqXCeBanb5jT43lN+oFM2g8uuwrcL82hvXrKMPRO8
	43fHLqtz5+Oxt/QQKZ5YL00OvgzzCj0qH+WSoXb7/sJ+Ks9PGAUENC3l2Nj8=
MIME-Version: 1.0
X-Received: by 2002:a05:6808:138c:b0:4e5:2f2e:45b4 with SMTP id
 5614622812f47-50c4e681484mr3422688b6e.21.1791597568007; Fri, 09 Oct 2026
 18:59:28 -0700 (PDT)
Date: Fri, 09 Oct 2026 18:59:27 -0700
In-Reply-To: <6aa9b9b7.f81106d8.2ab401.006f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac99bff.8cdf6287.1eb53.006f.GAE@google.com>
Subject: Re: [syzbot] [wireguard?] BUG: workqueue lockup in wg_packet_decrypt_worker
From: syzbot <syzbot+d0d2f1a65f45b319d25d@syzkaller.appspotmail.com>
To: Jason@zx2c4.com, andrew@lunn.ch, catalin.marinas@arm.com, 
	davem@davemloft.net, edumazet@google.com, jason@zx2c4.com, kuba@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mark.rutland@arm.com, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com, will@kernel.org, wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_185930_141134_FE924931 
X-CRM114-Status: UNSURE (   4.50  )
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    71c3e5409eef Merge remote-tracking branch 'will/for-next/p.=
.
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.g=
it for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=3D13fb40a5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D42bd821301b4274=
2
dashboard link: https://syzkaller.appspot.com/bug?extid=3Dd0d2f1a65f45b319d=
25d
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-=
1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D171efa8e58000=
0
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D1030649c580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7596ece97a32/disk-=
71c3e540.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4d2c36351098/vmlinux-=
71c3e540.xz
kernel image: https://storage.googleapis.com/syzbot-assets/396ce0b85b3c/Ima=
ge-71c3e540.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit=
:
Reported-by: syzbot+d0d2f1a65f45b319d25d@syzkaller.appspotmail.com

bridge0: received packet on veth1_to_bridge with own address as source addr=
ess (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on bridge_slave_1 with own address as source addre=
ss (addr:aa:aa:aa:aa:aa:1c, vlan:0)
BUG: workqueue lockup - pool cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 stuck f=
or 58s!
Showing busy workqueues and worker pools:
workqueue events: flags=3D0x100
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D12 refcnt=3D13
    in-flight: 4802:switchdev_deferred_process_work for 64s ,9:request_firm=
ware_work_func for 147s ,4923:drm_fb_helper_damage_work for 58s ,10:nsim_fi=
b_event_work for 68s
    pending: 2*ovs_dp_masks_rebalance, 2*nsim_dev_hwstats_traffic_work, psi=
_avgs_work, drm_fb_helper_damage_work, vmstat_shepherd, free_obj_work
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D3 refcnt=3D4
    in-flight: 26:free_ipc for 13s
    pending: nsim_dev_hwstats_traffic_work, psi_avgs_work
workqueue events_unbound: flags=3D0x2
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D4 refcnt=3D5
    in-flight: 4976:cfg80211_wiphy_work for 110s cfg80211_wiphy_work ,1204:=
cfg80211_wiphy_work for 114s cfg80211_wiphy_work
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D12 refcnt=3D13
    in-flight: 240:cfg80211_wiphy_work for 48s ,14:cfg80211_wiphy_work for =
112s cfg80211_wiphy_work ,4979:nsim_dev_trap_report_work for 0s ,48:nsim_de=
v_trap_report_work for 0s ,1190:cfg80211_wiphy_work for 105s cfg80211_wiphy=
_work ,4980:nsim_dev_trap_report_work for 0s ,4978:macvlan_process_broadcas=
t for 3s
    pending: flush_memcg_stats_dwork, nsim_dev_trap_report_work, toggle_all=
ocation_gate
workqueue events_power_efficient: flags=3D0x82
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D5 refcnt=3D6
    in-flight: 3700:neigh_periodic_work for 36s
    pending: 2*neigh_managed_work, fb_flashcursor, gc_worker
workqueue rcu_gp: flags=3D0x108
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D4 MAYDA=
Y
    pending: srcu_invoke_callbacks
workqueue netns: flags=3D0x6000a
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D4
    in-flight: 12:cleanup_net for 116s
workqueue mm_percpu_wq: flags=3D0x108
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D4 MAYDA=
Y
    pending: vmstat_update
workqueue writeback: flags=3D0x4a
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D2
    in-flight: 59:wb_workfn for 111s
workqueue mld: flags=3D0x40108
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D55 MAYD=
AY
    pending: mld_dad_work
    inactive: mld_dad_work, 3*mld_ifc_work, mld_dad_work, 5*mld_ifc_work, 2=
*mld_dad_work, mld_ifc_work, mld_dad_work, 3*mld_ifc_work, mld_dad_work, 9*=
mld_ifc_work, 25*mld_dad_work
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D79 MAYD=
AY
    in-flight: 1495:mld_ifc_work for 0s
    inactive: mld_ifc_work, mld_dad_work, mld_ifc_work, 3*mld_dad_work, 4*m=
ld_ifc_work, 2*mld_dad_work, mld_ifc_work, 2*mld_dad_work, mld_ifc_work, ml=
d_dad_work, mld_ifc_work, 2*mld_dad_work, 4*mld_ifc_work, mld_dad_work, 4*m=
ld_ifc_work, 2*mld_dad_work, 4*mld_ifc_work, 3*mld_dad_work, 4*mld_ifc_work=
, 4*mld_dad_work, 4*mld_ifc_work, mld_dad_work, 4*mld_ifc_work, mld_dad_wor=
k, 3*mld_ifc_work, 2*mld_dad_work, 4*mld_ifc_work, 10*mld_dad_work
workqueue ipv6_addrconf: flags=3D0x6000a
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D222 MAYDAY
    in-flight: 2825(RESCUER):addrconf_dad_work for 64s
    inactive: 215*addrconf_dad_work, addrconf_verify_work
workqueue bat_events: flags=3D0x6000a
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D50 MAYDAY
    in-flight: 2857(RESCUER):batadv_tt_purge for 1s
    pending: mayday_cursor_func
    inactive: batadv_mcast_mla_update, 2*batadv_iv_send_outstanding_bat_ogm=
_packet, 4*batadv_mcast_mla_update, batadv_iv_send_outstanding_bat_ogm_pack=
et, batadv_purge_orig, 9*batadv_iv_send_outstanding_bat_ogm_packet, batadv_=
mcast_mla_update, 3*batadv_purge_orig, 4*batadv_iv_send_outstanding_bat_ogm=
_packet, 2*batadv_purge_orig, batadv_dat_purge, batadv_bla_periodic_work, b=
atadv_dat_purge, batadv_bla_periodic_work, batadv_dat_purge, batadv_bla_per=
iodic_work, batadv_dat_purge, batadv_bla_periodic_work, batadv_dat_purge, b=
atadv_bla_periodic_work, batadv_dat_purge, batadv_bla_periodic_work, 4*bata=
dv_tt_purge
workqueue wg-kex-wg0: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    in-flight: 24:wg_packet_handshake_receive_worker for 1s
workqueue wg-crypt-wg0: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D3 refcnt=3D6 MAYDA=
Y
    pending: wg_packet_encrypt_worker, wg_packet_tx_worker, wg_packet_decry=
pt_worker
workqueue wg-crypt-wg1: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D3 refcnt=3D6 MAYDA=
Y
    pending: wg_packet_encrypt_worker, wg_packet_decrypt_worker, wg_packet_=
tx_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D3 MAYDA=
Y
    pending: wg_packet_decrypt_worker
workqueue wg-kex-wg2: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
workqueue wg-crypt-wg2: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D4 refcnt=3D7 MAYDA=
Y
    in-flight: 4811:wg_packet_decrypt_worker for 64s wg_packet_decrypt_work=
er
    pending: wg_packet_encrypt_worker, wg_packet_tx_worker
workqueue wg-kex-wg0: flags=3D0x6
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_send_worker
workqueue wg-crypt-wg0: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D4 refcnt=3D7 MAYDA=
Y
    in-flight: 4471:wg_packet_decrypt_worker for 63s
    pending: wg_packet_decrypt_worker, wg_packet_encrypt_worker, wg_packet_=
tx_worker
workqueue wg-kex-wg0: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
workqueue wg-kex-wg0: flags=3D0x6
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_send_worker
workqueue wg-crypt-wg0: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D3 refcnt=3D6 MAYDA=
Y
    pending: wg_packet_encrypt_worker, wg_packet_decrypt_worker, wg_packet_=
tx_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D3 MAYDA=
Y
    pending: wg_packet_decrypt_worker
workqueue wg-crypt-wg1: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D3 refcnt=3D6 MAYDA=
Y
    pending: wg_packet_decrypt_worker, wg_packet_encrypt_worker, wg_packet_=
tx_worker
workqueue wg-kex-wg1: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
workqueue wg-crypt-wg1: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D3 refcnt=3D6 MAYDA=
Y
    pending: wg_packet_decrypt_worker, wg_packet_encrypt_worker, wg_packet_=
tx_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D2 refcnt=3D4 MAYDA=
Y
    pending: wg_packet_decrypt_worker, wg_packet_tx_worker
workqueue wg-crypt-wg2: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D3 refcnt=3D6 MAYDA=
Y
    pending: wg_packet_decrypt_worker, wg_packet_encrypt_worker, wg_packet_=
tx_worker
workqueue wg-kex-wg2: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D2 refcnt=3D3
    in-flight: 4977:wg_packet_handshake_receive_worker for 107s wg_packet_h=
andshake_receive_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D2 refcnt=3D3
    in-flight: 1496:wg_packet_handshake_receive_worker for 12s wg_packet_ha=
ndshake_receive_worker
workqueue wg-crypt-wg2: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D3 refcnt=3D6 MAYDA=
Y
    pending: wg_packet_tx_worker, wg_packet_decrypt_worker, wg_packet_encry=
pt_worker
pool 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 hung=3D58s workers=3D8 manag=
er: 1091
pool 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D0s workers=3D7 idle: =
4930 866 4981
pool 8: cpus=3D0-1 flags=3D0x6 nice=3D0 hung=3D0s workers=3D13 manager: 40
Showing backtraces of busy workers in stalled worker pools:
pool 2:
task:kworker/0:5     state:R  running task     stack:0     pid:4811  tgid:4=
811  ppid:2      task_flags:0x4208060 flags:0x20000010
Workqueue: wg-crypt-wg2 wg_packet_decrypt_worker
Call trace:
 __switch_to+0x2b4/0x6e4 arch/arm64/kernel/process.c:775 (T)
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x135c/0x2b00 kernel/sched/core.c:7284
 preempt_schedule_common+0xd4/0x190 kernel/sched/core.c:7463
 preempt_schedule+0x60/0x78 kernel/sched/core.c:7487
 __local_bh_enable_ip+0x16c/0x234 kernel/softirq.c:480
 local_bh_enable include/linux/bottom_half.h:33 [inline]
 put_cpu_fpsimd_context arch/arm64/kernel/fpsimd.c:251 [inline]
 kernel_neon_begin+0x29c/0x400 arch/arm64/kernel/fpsimd.c:1924
 class_ksimd_constructor arch/arm64/include/asm/simd.h:48 [inline]
 poly1305_blocks+0x110/0x204 lib/crypto/arm64/poly1305.h:30
 poly1305_update+0x168/0x39c lib/crypto/poly1305.c:59
 chacha20poly1305_crypt_sg_inplace+0x888/0xc30 lib/crypto/chacha20poly1305.=
c:304
 chacha20poly1305_decrypt_sg_inplace+0x6c/0x94 lib/crypto/chacha20poly1305.=
c:353
 decrypt_packet drivers/net/wireguard/receive.c:278 [inline]
 wg_packet_decrypt_worker+0x490/0xa00 drivers/net/wireguard/receive.c:501
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3479
 worker_thread+0x798/0xbd0 kernel/workqueue.c:3560
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854
pool 2:
task:kworker/0:7     state:R  running task     stack:0     pid:4977  tgid:4=
977  ppid:2      task_flags:0x4208060 flags:0x20000010
Workqueue: wg-kex-wg2 wg_packet_handshake_receive_worker
Call trace:
 __switch_to+0x2b4/0x6e4 arch/arm64/kernel/process.c:775 (T)
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x135c/0x2b00 kernel/sched/core.c:7284
 preempt_schedule_common+0xd4/0x190 kernel/sched/core.c:7463
 preempt_schedule+0x60/0x78 kernel/sched/core.c:7487
 __local_bh_enable_ip+0x16c/0x234 kernel/softirq.c:480
 local_bh_enable include/linux/bottom_half.h:33 [inline]
 put_cpu_fpsimd_context arch/arm64/kernel/fpsimd.c:251 [inline]
 kernel_neon_begin+0x29c/0x400 arch/arm64/kernel/fpsimd.c:1924
 class_ksimd_constructor arch/arm64/include/asm/simd.h:48 [inline]
 poly1305_blocks+0x110/0x204 lib/crypto/arm64/poly1305.h:30
 poly1305_update+0x168/0x39c lib/crypto/poly1305.c:59
 __chacha20poly1305_decrypt+0x240/0x39c lib/crypto/chacha20poly1305.c:151
 chacha20poly1305_decrypt+0x238/0x5e4 lib/crypto/chacha20poly1305.c:186
 message_decrypt+0x50/0x90 drivers/net/wireguard/noise.c:477
 wg_noise_handshake_consume_initiation+0x1a0/0x53c drivers/net/wireguard/no=
ise.c:612
 wg_receive_handshake_packet drivers/net/wireguard/receive.c:144 [inline]
 wg_packet_handshake_receive_worker+0x54c/0xcf8 drivers/net/wireguard/recei=
ve.c:213
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3479
 worker_thread+0x798/0xbd0 kernel/workqueue.c:3560
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854
pool 2:
task:kworker/0:6     state:R  running task     stack:0     pid:4923  tgid:4=
923  ppid:2      task_flags:0x4208060 flags:0x00000010
Workqueue: events drm_fb_helper_damage_work
Call trace:
 __switch_to+0x2b4/0x6e4 arch/arm64/kernel/process.c:775 (T)
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x135c/0x2b00 kernel/sched/core.c:7284
 __schedule_loop kernel/sched/core.c:7361 [inline]
 schedule+0x13c/0x20c kernel/sched/core.c:7376
 schedule_timeout+0x13c/0x28c kernel/time/sleep_timeout.c:99
 drm_crtc_wait_one_vblank+0x19c/0x440 drivers/gpu/drm/drm_vblank.c:1325
 drm_client_modeset_wait_for_vblank+0xc4/0xec drivers/gpu/drm/drm_client_mo=
deset.c:1331
 drm_fb_helper_fb_dirty drivers/gpu/drm/drm_fb_helper.c:327 [inline]
 drm_fb_helper_damage_work+0x520/0xbc0 drivers/gpu/drm/drm_fb_helper.c:365
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3479
 worker_thread+0x798/0xbd0 kernel/workqueue.c:3560
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854
pool 2:
task:kworker/0:1     state:R  running task     stack:0     pid:10    tgid:1=
0    ppid:2      task_flags:0x4208060 flags:0x00000010
Workqueue: events nsim_fib_event_work
Call trace:
 __switch_to+0x2b4/0x6e4 arch/arm64/kernel/process.c:775 (T)
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x135c/0x2b00 kernel/sched/core.c:7284
 __schedule_loop kernel/sched/core.c:7361 [inline]
 schedule+0x13c/0x20c kernel/sched/core.c:7376
 schedule_timeout+0x13c/0x28c kernel/time/sleep_timeout.c:99
 schedule_timeout_uninterruptible+0x78/0xbc kernel/time/sleep_timeout.c:158
 msleep+0x3c/0x68 kernel/time/sleep_timeout.c:318
 nsim_fib6_rt_add drivers/net/netdevsim/fib.c:693 [inline]
 nsim_fib6_rt_insert drivers/net/netdevsim/fib.c:759 [inline]
 nsim_fib6_event drivers/net/netdevsim/fib.c:856 [inline]
 nsim_fib_event+0x57a0/0x60c4 drivers/net/netdevsim/fib.c:889
 nsim_fib_event_work+0x1d8/0x320 drivers/net/netdevsim/fib.c:1493
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3479
 worker_thread+0x798/0xbd0 kernel/workqueue.c:3560
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854
pool 2:
task:kworker/0:3     state:R  running task     stack:0     pid:4471  tgid:4=
471  ppid:2      task_flags:0x4208060 flags:0x00000010
Workqueue: wg-crypt-wg0 wg_packet_decrypt_worker
Call trace:
 __switch_to+0x2b4/0x6e4 arch/arm64/kernel/process.c:775 (T)
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x135c/0x2b00 kernel/sched/core.c:7284
 preempt_schedule_common+0xd4/0x190 kernel/sched/core.c:7463
 preempt_schedule+0x60/0x78 kernel/sched/core.c:7487
 __local_bh_enable_ip+0x16c/0x234 kernel/softirq.c:480
 __raw_spin_unlock_bh include/linux/spinlock_api_smp.h:237 [inline]
 _raw_spin_unlock_bh+0x3c/0x4c kernel/locking/spinlock.c:245
 spin_unlock_bh include/linux/spinlock.h:407 [inline]
 ptr_ring_consume_bh include/linux/ptr_ring.h:399 [inline]
 wg_packet_decrypt_worker+0x254/0xa00 drivers/net/wireguard/receive.c:499
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3479
 worker_thread+0x798/0xbd0 kernel/workqueue.c:3560
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854
net_ratelimit: 70318 callbacks suppressed
bridge0: received packet on bridge_slave_1 with own address as source addre=
ss (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on bridge_slave_1 with own address as source addre=
ss (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on bridge_slave_1 with own address as source addre=
ss (addr:aa:aa:aa:aa:aa:1c, vlan:0)
bridge0: received packet on bridge_slave_1 with own address as source addre=
ss (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on veth1_to_bridge with own address as source addr=
ess (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on bridge_slave_1 with own address as source addre=
ss (addr:aa:aa:aa:aa:aa:1c, vlan:0)
bridge0: received packet on bridge_slave_1 with own address as source addre=
ss (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on bridge_slave_1 with own address as source addre=
ss (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on bridge_slave_1 with own address as source addre=
ss (addr:aa:aa:aa:aa:aa:1c, vlan:0)


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

