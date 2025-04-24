Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A075DC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ys+r4b/bN1N9MasjKmdqEss1ssV3C7RnEHLMtxbroxU=; b=lvcgRWP/6qkqfjrMpMJYDTStnc
	9iYDXYfsN4HQBLJb2iM3W8xEX/7cJnZoXS1S0ev9wmNtfdEZv2TfxdiHjKm/2k4mCyiHBmQNKPhTZ
	/JD/IKSAgEkv2nxExdeRxOQidcsXk0QB9vIDrFIRgxaWn0RgiRnLDInzY9K697ZyxZcKEFZJuQZun
	943kFKX7BxIGbasD5BjGUWqGbWvFftAMKIHzbTOSYGLoORIbu1NAw57UxyDHVJJei8IXz3YjvwUfm
	Pt3PhpTnoKMcLt4Up9haEd9KmuoC07rV7n8sFJzSc2yBNW9Bx/AWS/2uJiQE523dmb8YOEV7JyC3t
	rK3IIw2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z5A-0000000Ed4k-3xrz;
	Thu, 24 Apr 2025 16:05:48 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xKv-0000000EKfV-30Gg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:13:59 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-39c14016868so1019715f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504036; x=1746108836; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ys+r4b/bN1N9MasjKmdqEss1ssV3C7RnEHLMtxbroxU=;
        b=xIBuf9CWErKAiEnvHv5QEkVuHX/S0z+fsAieRagM7Yt53eYP0O8xEn+4+mXK3OiHTb
         SZSK9GZeet46wTQf0sfVw5Yyy42RLss+vzSPBCHG89qk0PF0O8fCD9Kxyz+Z63k78S/W
         JVAScqJhTDbwux6/V9SoockS4rRQZvEAhr98V099pJnnDvDcZPTNvWtmhcwTiWBclMb8
         pdvHkILqvAmPJy17JCIbPdWfQOXxpvQBZv+LuTjhzjDhofqEXy47WfpBpW/Eq2vbP4kj
         jkgBepEklF1wj3CBUmmNyJkdBDFX9Rw6SXDzb5mZknsut9jrXloDGrY8XlRfhvSVBCJ0
         XyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504036; x=1746108836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ys+r4b/bN1N9MasjKmdqEss1ssV3C7RnEHLMtxbroxU=;
        b=FWVkGlQy+4gwlYyB1CsZBwKdXqLkx6m6GISlvQiGa/dBXEZZn8bU1v53xb16Q+0WFQ
         ZBuhBMYnhPQBcJUbZxtnofjADZAyJlmwHfxGskFiulCsmHWLAXzdOFiahVTQpHTh8X1K
         reAqYanZfb9u61su22CWXA2vo30r+noEi7YdfzGOuwgRfINGfMmnvovoR4XlCi1FjeIX
         XLu6gUF+TctWKTVNA3kNSTB+cs/zEHR7xX7OtQhY2n/huoVkmNpoqFgX+rcwVKwKrZoI
         srv52b3Q4pK+vwHvimXJUfc5aFK6ADFCC4Po/MKPcir2NF3H6/oOifuaI+Vi8u3cFh8r
         vkmA==
X-Forwarded-Encrypted: i=1; AJvYcCX/KQluDz4DeoOgTxd3VMP3ijzKRN8Jcec7QwbZUxMnxEQt6uHJqzYc6/k7tRC/z4BF/pdIgPvuUL/am2n2f9oV@lists.infradead.org
X-Gm-Message-State: AOJu0YxTccWGRNgE5XU/m0RBo1nM4sMG5hV5qnVBZzaWArdG2Agl4hYh
	TpqABiTteUs506RS9NnrEcM7OR0ECBhtITfY1yr4Kzcxg6xSuGIrXVczGjw1vek=
X-Gm-Gg: ASbGncv8OZ1m4gmymWvhEPjWgBlhzEdWUj601rvAamaAtlaJaZjYLSf6qNK4Dfh4esW
	DjziXAEY5WV/vkiNdjq1QzhR3RnlpmBCDkyvrS67rHYC3wUf3HiFw7AHC0VC3ZRZSXw9HSjKhgk
	TMutgu3n/ogheZMzI/IEbmv/o+8GdHTqyekL4ijIoxJqoDfuq9eVS17wKrKifAM5mbQtsbdczko
	OlwQwhvIreDYk1sgRwhj20VPD8f7BZ6SWR2EH91gDZjd2G/NtNm22b09EvH2SWuejwjwGG5MHle
	VwgnmWQNhfDpZd/HKNjghNRzaloKjP7MZcEeUyk03fnVfNA/QUPQa4LxUZ41t2tM+w7tpr+TpTu
	TcdWYtENxEpVg9wqb
X-Google-Smtp-Source: AGHT+IEV5wfX7DpJOSMs66ZIGfzUTJLqW6iFySId3MuH6gASyxb/C/SH9jqJ4yi7vysyGZwOnlgesg==
X-Received: by 2002:a5d:47cb:0:b0:391:3fa7:bf77 with SMTP id ffacd0b85a97d-3a06cf63697mr2421146f8f.31.1745504035418;
        Thu, 24 Apr 2025 07:13:55 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:13:54 -0700 (PDT)
From: Karim Manaouil <karim.manaouil@linaro.org>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Karim Manaouil <karim.manaouil@linaro.org>,
	Alexander Graf <graf@amazon.com>,
	Alex Elder <elder@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
	Quentin Perret <qperret@google.com>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Will Deacon <will@kernel.org>,
	Haripranesh S <haripran@qti.qualcomm.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>,
	Murali Nalajala <mnalajal@quicinc.com>,
	Sreenivasulu Chalamcharla <sreeniva@qti.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>
Subject: [RFC PATCH 08/34] docs: gunyah: Introduce Gunyah Hypervisor
Date: Thu, 24 Apr 2025 15:13:15 +0100
Message-Id: <20250424141341.841734-9-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_071357_759283_40A9E966 
X-CRM114-Status: GOOD (  29.27  )
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

From: Elliot Berman <quic_eberman@quicinc.com>

Gunyah is an open-source Type-1 hypervisor developed by Qualcomm. It
does not depend on any lower-privileged OS/kernel code for its core
functionality. This increases its security and can support a smaller
trusted computing based when compared to Type-2 hypervisors.

Add documentation describing the Gunyah hypervisor and the main
components of the Gunyah hypervisor which are of interest to Linux
virtualization development.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Reviewed-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 Documentation/virt/gunyah/index.rst         | 135 ++++++++++++++++++++
 Documentation/virt/gunyah/message-queue.rst |  68 ++++++++++
 Documentation/virt/index.rst                |   1 +
 3 files changed, 204 insertions(+)
 create mode 100644 Documentation/virt/gunyah/index.rst
 create mode 100644 Documentation/virt/gunyah/message-queue.rst

diff --git a/Documentation/virt/gunyah/index.rst b/Documentation/virt/gunyah/index.rst
new file mode 100644
index 000000000000..fba2c7a11d0f
--- /dev/null
+++ b/Documentation/virt/gunyah/index.rst
@@ -0,0 +1,135 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=================
+Gunyah Hypervisor
+=================
+
+.. toctree::
+   :maxdepth: 1
+
+   message-queue
+
+Gunyah is a Type-1 hypervisor which is independent of any OS kernel, and runs in
+a more privileged CPU level (EL2 on Aarch64). It does not depend on a less
+privileged operating system for its core functionality. This increases its
+security and can support a much smaller trusted computing base than a Type-2
+hypervisor.
+
+Gunyah is an open source hypervisor. The source repository is available at
+https://github.com/quic/gunyah-hypervisor.
+
+Gunyah provides these following features.
+
+- Scheduling:
+
+  A scheduler for virtual CPUs (vCPUs) on physical CPUs enables time-sharing
+  of the CPUs. Gunyah supports two models of scheduling which can coexist on
+  a running system:
+
+    1. Hypervisor vCPU scheduling in which Gunyah hypervisor schedules vCPUS on
+       its own. The default is a real-time priority with round-robin scheduler.
+    2. "Proxy" scheduling in which an owner-VM can donate the remainder of its
+       own vCPU's time slice to an owned-VM's vCPU via a hypercall.
+
+- Memory Management:
+
+  APIs handling memory, abstracted as objects, limiting direct use of physical
+  addresses. Memory ownership and usage tracking of all memory under its control.
+  Memory partitioning between VMs is a fundamental security feature.
+
+- Interrupt Virtualization:
+
+  Interrupt ownership is tracked and interrupt delivery is directly to the
+  assigned VM. Gunyah makes use of hardware interrupt virtualization where
+  possible.
+
+- Inter-VM Communication:
+
+  There are several different mechanisms provided for communicating between VMs.
+
+    1. Message queues
+    2. Doorbells
+    3. Virtio MMIO transport
+    4. Shared memory
+
+- Virtual platform:
+
+  Architectural devices such as interrupt controllers and CPU timers are
+  directly provided by the hypervisor as well as core virtual platform devices
+  and system APIs such as ARM PSCI.
+
+- Device Virtualization:
+
+  Para-virtualization of devices is supported using inter-VM communication and
+  virtio transport support. Select stage 2 faults by virtual machines that use
+  proxy-scheduled vCPUs can be handled directly by Linux to provide Type-2
+  hypervisor style on-demand paging and/or device emulation.
+
+Architectures supported
+=======================
+AArch64 with a GICv3 or GICv4.1
+
+Resources and Capabilities
+==========================
+
+Services/resources provided by the Gunyah hypervisor are accessible to a
+virtual machine through capabilities. A capability is an access control
+token granting the holder a set of permissions to operate on a specific
+hypervisor object (conceptually similar to a file-descriptor).
+For example, inter-VM communication using Gunyah doorbells and message queues
+is performed using hypercalls taking Capability ID arguments for the required
+IPC objects. These resources are described in Linux as a struct gunyah_resource.
+
+Unlike UNIX file descriptors, there is no path-based or similar lookup of
+an object to create a new Capability, meaning simpler security analysis.
+Creation of a new Capability requires the holding of a set of privileged
+Capabilities which are typically never given out by the Resource Manager (RM).
+
+Gunyah itself provides no APIs for Capability ID discovery. Enumeration of
+Capability IDs is provided by RM as a higher level service to VMs.
+
+Resource Manager
+================
+
+The Gunyah Resource Manager (RM) is a privileged application VM supporting the
+Gunyah Hypervisor. It provides policy enforcement aspects of the virtualization
+system. The resource manager can be treated as an extension of the Hypervisor
+but is separated to its own partition to ensure that the hypervisor layer itself
+remains small and secure and to maintain a separation of policy and mechanism in
+the platform. The resource manager runs at arm64 NS-EL1, similar to other
+virtual machines.
+
+Communication with the resource manager from other virtual machines happens as
+described in message-queue.rst. Details about the specific messages can be found
+in drivers/virt/gunyah/rsc_mgr.c
+
+::
+
+  +-------+   +--------+   +--------+
+  |  RM   |   |  VM_A  |   |  VM_B  |
+  +-.-.-.-+   +---.----+   +---.----+
+    | |           |            |
+  +-.-.-----------.------------.----+
+  | | \==========/             |    |
+  |  \========================/     |
+  |            Gunyah               |
+  +---------------------------------+
+
+The source for the resource manager is available at
+https://github.com/quic/gunyah-resource-manager.
+
+The resource manager provides the following features:
+
+- VM lifecycle management: allocating a VM, starting VMs, destruction of VMs
+- VM access control policy, including memory sharing and lending
+- Interrupt routing configuration
+- Forwarding of system-level events (e.g. VM shutdown) to owner VM
+- Resource (capability) discovery
+
+A VM requires boot configuration to establish communication with the resource
+manager. This is provided to VMs via a 'hypervisor' device tree node which is
+overlaid to the VMs DT by the RM. This node lets guests know they are running
+as a Gunyah guest VM, how to communicate with resource manager, and basic
+description and capabilities of this VM. See
+Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml for a
+description of this node.
diff --git a/Documentation/virt/gunyah/message-queue.rst b/Documentation/virt/gunyah/message-queue.rst
new file mode 100644
index 000000000000..96864708f442
--- /dev/null
+++ b/Documentation/virt/gunyah/message-queue.rst
@@ -0,0 +1,68 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Message Queues
+==============
+Message queue is a simple low-capacity IPC channel between two virtual machines.
+It is intended for sending small control and configuration messages. Each
+message queue is unidirectional and buffered in the hypervisor. A full-duplex
+IPC channel requires a pair of queues.
+
+The size of the queue and the maximum size of the message that can be passed is
+fixed at creation of the message queue. Resource manager is presently the only
+use case for message queues, and creates messages queues between itself and VMs
+with a fixed maximum message size of 240 bytes. Longer messages require a
+further protocol on top of the message queue messages themselves. For instance,
+communication with the resource manager adds a header field for sending longer
+messages which are split into smaller fragments.
+
+The diagram below shows how message queue works. A typical configuration
+involves 2 message queues. Message queue 1 allows VM_A to send messages to VM_B.
+Message queue 2 allows VM_B to send messages to VM_A.
+
+1. VM_A sends a message of up to 240 bytes in length. It makes a hypercall
+   with the message to request the hypervisor to add the message to
+   message queue 1's queue. The hypervisor copies memory into the internal
+   message queue buffer; the memory doesn't need to be shared between
+   VM_A and VM_B.
+
+2. Gunyah raises the corresponding interrupt for VM_B (Rx vIRQ) when any of
+   these happens:
+
+   a. gunyah_msgq_send() has PUSH flag. This is a typical case when the message
+      queue is being used to implement an RPC-like interface.
+   b. Explicitly with gunyah_msgq_push hypercall from VM_A.
+   c. Message queue has reached a threshold depth. Typically, this threshold
+      depth is the size of the queue (in other words: when queue is full, Rx
+      vIRQ is raised).
+
+3. VM_B calls gunyah_msgq_recv() and Gunyah copies message to requested buffer.
+
+4. Gunyah raises the corresponding interrupt for VM_A (Tx vIRQ) when the message
+   queue falls below a watermark depth. Typically, this is when the queue is
+   drained. Note the watermark depth and the threshold depth for the Rx vIRQ are
+   independent values. Coincidentally, this signal is conceptually similar to
+   Clear-to-Send.
+
+For VM_B to send a message to VM_A, the process is identical, except that
+hypercalls reference message queue 2's capability ID. The IRQ will be different
+for the second message queue.
+
+::
+
+      +-------------------+         +-----------------+         +-------------------+
+      |        VM_A       |         |Gunyah hypervisor|         |        VM_B       |
+      |                   |         |                 |         |                   |
+      |                   |         |                 |         |                   |
+      |                   |   Tx    |                 |         |                   |
+      |                   |-------->|                 | Rx vIRQ |                   |
+      |gunyah_msgq_send() | Tx vIRQ |Message queue 1  |-------->|gunyah_msgq_recv() |
+      |                   |<------- |                 |         |                   |
+      |                   |         |                 |         |                   |
+      |                   |         |                 |         |                   |
+      |                   |         |                 |   Tx    |                   |
+      |                   | Rx vIRQ |                 |<--------|                   |
+      |gunyah_msgq_recv() |<--------|Message queue 2  | Tx vIRQ |gunyah_msgq_send() |
+      |                   |         |                 |-------->|                   |
+      |                   |         |                 |         |                   |
+      |                   |         |                 |         |                   |
+      +-------------------+         +-----------------+         +---------------+
diff --git a/Documentation/virt/index.rst b/Documentation/virt/index.rst
index 7fb55ae08598..15869ee059b3 100644
--- a/Documentation/virt/index.rst
+++ b/Documentation/virt/index.rst
@@ -16,6 +16,7 @@ Virtualization Support
    coco/sev-guest
    coco/tdx-guest
    hyperv/index
+   gunyah/index
 
 .. only:: html and subproject
 
-- 
2.39.5


