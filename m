Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D258C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 18:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:
	Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L49TGW+7xz/Nh6pz+awW7HEg66lfzot3qylqJrkV2gw=; b=xLbug3IpspoEgvH/GrfUNslSqS
	1jT2zsf1HlW/Er2GRErnSin0EMJ5kUB97VhfOGILkGwBIz88XO/rTzVFbymyCXhMZPJXBxP32IS74
	p2UeOeY+98me0Hr2ZHF28BdA2x04/K8/X0zYaJPjL8b2UqXgVrb9Dbm+MaS+zip6gE1itIphERe2B
	5HZKO8SBHH7oP7dfdk4F3Thd2QrxFdh5oZAlV13RwP/1/gKpLvcoHiB5e4xIhkwT6QIyIEFq2phQx
	818IyDjOePeL2qo5AX3r/bfazeVskmDzHTZXYKoBbfmfABCMAhJqoLeqY2v/xadwFsnQlbq+Ou+V6
	7ibYnkoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4l2w-00000006j1s-2BtR;
	Tue, 15 Apr 2025 18:30:10 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4l16-00000006ikI-3qYz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 18:28:18 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so62113425e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 11:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744741695; x=1745346495; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L49TGW+7xz/Nh6pz+awW7HEg66lfzot3qylqJrkV2gw=;
        b=drWn6uMUErfjrRrTJ6zEt5IkPOPW0Z5RtBKM8h2pBO9SkSwS37eBHMWEajwuQ9anjR
         m6XJtHM80HV0rkYv6Mr/55dPqoUGl+CPNJFkvWXHcy5ScTCV92FOtMdJB2pd/46b0jUu
         KrkmTNbSYY4Dgyym7MF8sCWukqgyc5/LZcz0zkFLK7oZaULxRXAkyehfmjgQt//EdiHk
         QvOc/+tNxPGanpbKPVF+vMvCNosRWiN7R+rBCdV3vm3aDN2X+CPw9Cvmu1cJQ6/YkP7d
         Wi0ghGnIo9Dgx4n8VN99bThhDt36IieKAiki8ArR7pPC2/BVGIHvOaUuiM8BY1VNmdNo
         RYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744741695; x=1745346495;
        h=cc:to:from:subject:message-id:date:content-transfer-encoding
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L49TGW+7xz/Nh6pz+awW7HEg66lfzot3qylqJrkV2gw=;
        b=glmP9GPxlTM7xuYRULPTU97DX1G96zsLbTpssoLPXshAk33EKhQAYa30EEMlpbsxv3
         KCN3xASQPcG27jqMC+++UBLuunkBRug75JVToAHRvYocy4EJPVnQ/oXW4HkB1iqs6tip
         bjzVT3isnHiIsSmw0aJT6FUCHzuvU/6mGnf30br03Mvi5SRNpexh9Edg4nzivH7eLfGT
         Wkafl/jbvEhcUZO+YSjK2RqzrA+jw4tmtrb8lP86WR7cE9rAVcQt8hTRH9AZZO5LfIHT
         gxjOQ4eZmhZOAXqlTN71iHvqSgzIgjdum6aIbYF61d+g/3iNWqI0PU37ttbIn1vNop6q
         ZCow==
X-Forwarded-Encrypted: i=1; AJvYcCU3xMTe3JQXpny+h76C6OhQFO+C7ZhL2hFwH4g3J0GVJVSFtMMp8PctEwPWxhbzg7kzqdWs+22CYUh5yv6CgcTA@lists.infradead.org
X-Gm-Message-State: AOJu0YyV7nnhSas32z82+3XdgSLtJ10zC2RYi2kCyS2jfpYMA5gJzYZf
	LMIgJbgq3d06loY8nAEGS+exXqQwy5w+SF9aNZQALq11GsqR/Blvsya7Va7C71E=
X-Gm-Gg: ASbGncvrlDnhT4wL8RfZXPQpXojZLgGI8kxVSgdsKE4wpKJV56FXdKSPKaz1EGTf0OQ
	Y48jL82FAPZSPOlknGLfuiDaITPZj4+0YjvhHz8b7qbS8Bd95IuEM8xRZY6FM02hInRLoRkPDjL
	vi4kihZvXoSRR/wef3giZIkvnZsNlUuwqItiOm4ERSpmLsV89FA6XbxmsIK7V3quQu6gdFlF4of
	kyKMR5mnn+Y6xHyUl1oD7i6sGcORhpfPQthGpgK93TUaCis5TYhJ8O3XCdjHfnmxFkVBojFCUSN
	l/AdD+2Y/MOKKQo7zc/VQMsoK4hCWkT6IEkxWy2y
X-Google-Smtp-Source: AGHT+IH6mc9ELyei13BV0wrRCDW96LMH74+mJafLGoFBT7/zz8c7C0skMK9mvtbozXXRqxJ2TdA7Lg==
X-Received: by 2002:a05:600c:1d95:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-44059fcb970mr2110625e9.10.1744741694981;
        Tue, 15 Apr 2025 11:28:14 -0700 (PDT)
Received: from localhost ([2.216.7.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445708sm15206699f8f.96.2025.04.15.11.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 11:28:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Apr 2025 19:28:13 +0100
Message-Id: <D97FB92117J2.PXTNFKCIRWAS@linaro.org>
Subject: [REGRESSION] amdgpu: async system error exception from
 hdp_v5_0_flush_hdp()
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: <alexander.deucher@amd.com>, <frank.min@amd.com>,
 <amd-gfx@lists.freedesktop.org>
Cc: <stable@vger.kernel.org>, <david.belanger@amd.com>,
 <christian.koenig@amd.com>, <peter.chen@cixtech.com>,
 <cix-kernel-upstream@cixtech.com>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.20.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_112816_972346_BAD5E15F 
X-CRM114-Status: GOOD (  11.54  )
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


#regzbot introduced: v6.12..v6.13

I use RX6600 on arm64 Orion o6 board and it seems that amdgpu is broken on =
recent kernels, fails on boot:

[drm] amdgpu: 7886M of GTT memory ready.
[drm] GART: num cpu pages 131072, num gpu pages 131072
SError Interrupt on CPU11, code 0x00000000be000011 -- SError
CPU: 11 UID: 0 PID: 255 Comm: (udev-worker) Tainted: G S                  6=
.15.0-rc2+ #1 VOLUNTARY
Tainted: [S]=3DCPU_OUT_OF_SPEC
Hardware name: Radxa Computer (Shenzhen) Co., Ltd. Radxa Orion O6/Radxa Ori=
on O6, BIOS 1.0 Jan  1 1980
pstate: 83400009 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=3D--)
pc : amdgpu_device_rreg+0x60/0xe4 [amdgpu]
lr : hdp_v5_0_flush_hdp+0x6c/0x80 [amdgpu]
sp : ffffffc08321b490
x29: ffffffc08321b490 x28: ffffff80b8b80000 x27: ffffff80b8bd0178
x26: ffffff80b8b8fe88 x25: 0000000000000001 x24: ffffff8081647000
x23: ffffffc079d6e000 x22: ffffff80b8bd5000 x21: 000000000007f000
x20: 000000000001fc00 x19: 00000000ffffffff x18: 00000000000015fc
x17: 00000000000015fc x16: 00000000000015cf x15: 00000000000015ce
x14: 00000000000015d0 x13: 00000000000015d1 x12: 00000000000015d2
x11: 00000000000015d3 x10: 000000000000ec00 x9 : 00000000000015fd
x8 : 00000000000015fd x7 : 0000000000001689 x6 : 0000000000555401
x5 : 0000000000000001 x4 : 0000000000100000 x3 : 0000000000100000
x2 : 0000000000000000 x1 : 000000000007f000 x0 : 0000000000000000
Kernel panic - not syncing: Asynchronous SError Interrupt
CPU: 11 UID: 0 PID: 255 Comm: (udev-worker) Tainted: G S                  6=
.15.0-rc2+ #1 VOLUNTARY
Tainted: [S]=3DCPU_OUT_OF_SPEC
Hardware name: Radxa Computer (Shenzhen) Co., Ltd. Radxa Orion O6/Radxa Ori=
on O6, BIOS 1.0 Jan  1 1980
Call trace:
 show_stack+0x2c/0x84 (C)
 dump_stack_lvl+0x60/0x80
 dump_stack+0x18/0x24
 panic+0x148/0x330
 add_taint+0x0/0xbc
 arm64_serror_panic+0x64/0x7c
 do_serror+0x28/0x68
 el1h_64_error_handler+0x30/0x48
 el1h_64_error+0x6c/0x70
 amdgpu_device_rreg+0x60/0xe4 [amdgpu] (P)
 hdp_v5_0_flush_hdp+0x6c/0x80 [amdgpu]
 gmc_v10_0_hw_init+0xec/0x1fc [amdgpu]
 amdgpu_device_init+0x19f8/0x2480 [amdgpu]
 amdgpu_driver_load_kms+0x20/0xb0 [amdgpu]
 amdgpu_pci_probe+0x1b8/0x5d4 [amdgpu]
 pci_device_probe+0xbc/0x1a8
 really_probe+0xc0/0x39c
 __driver_probe_device+0x7c/0x14c
 driver_probe_device+0x3c/0x120
 __driver_attach+0xc4/0x200
 bus_for_each_dev+0x68/0xb4
 driver_attach+0x24/0x30
 bus_add_driver+0x110/0x240
 driver_register+0x68/0x124
 __pci_register_driver+0x44/0x50
 amdgpu_init+0x84/0xf94 [amdgpu]
 do_one_initcall+0x60/0x1e0
 do_init_module+0x54/0x200
 load_module+0x18f8/0x1e68
 init_module_from_file+0x74/0xa0
 __arm64_sys_finit_module+0x1e0/0x3f0
 invoke_syscall+0x64/0xe4
 el0_svc_common.constprop.0+0x40/0xe0
 do_el0_svc+0x1c/0x28
 el0_svc+0x34/0xd0
 el0t_64_sync_handler+0x10c/0x138
 el0t_64_sync+0x198/0x19c
SMP: stopping secondary CPUs
Kernel Offset: disabled
CPU features: 0x1000,000000e0,f169a650,9b7ff667
Memory Limit: none
---[ end Kernel panic - not syncing: Asynchronous SError Interrupt ]---

(bios version seems to be 45 years old but that is the state of the board
when I received it)

Also saw this crash with RX6700. Old radeons like HD5450 and nvidia gt1030
work fine on that board.

A little bit of testing showed that it was introduced between 6.12 and 6.13=
.
Also it seems that changes were taken by some distro kernels already and
different iso images I tried failed to boot before I bumped into some iso
with kernel 6.8 that worked just fine.

The only change related to hdp_v5_0_flush_hdp() was
cf424020e040 drm/amdgpu/hdp5.0: do a posting read when flushing HDP

Reverting that commit ^^ did help and resolved that problem. Before sending
revert as-is I was interested to know if there supposed to be a proper fix
for this or maybe someone is interested to debug this or have any suggestio=
ns.

In theory I also need to confirm that exactly that change introduced the
regression.

Thanks,
Alexey


