Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065DACCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 07:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MPFm/NCSuFzQFNXPIOhYyn1i2VbzwCxQ/mJtEO742CY=; b=gmwfH7SMbcqK8d6LsPBoKATXsx
	T+YWgdVKwiGuWvyO32Ms5pLSZjW9ECbIs+L17RUeN3H1l5Dmt+RpOt4hW1e9XOMW3YpUcfGm0PMgu
	hTqhxFNgdGlyBsg13k8AU067ahSVD437m2iE9EMg61mX4Nw8cQ3TZoxbyUfmTMiB7+Gkn2GAgh7xZ
	29QpMUCnWu581KKVhfA5mBwdz1JwlQXgi/sl29Y3nXL4UMaBlEmCgF7yRnkSLf/3ISylIOOIe6PMs
	TlFy/Gg9woHDpMeU+qkFZrgQjtb0imOVnag9pdbmKFWK4E+k75td7CBmlwAbROcD9wy13ET+YiEXL
	9XbgyyaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCBs2-00000008PhB-3Aqb;
	Fri, 24 Oct 2025 07:05:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCBs0-00000008Pgn-03z1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 07:05:53 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3MF7A010330
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 07:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MPFm/NCSuFzQFNXPIOhYyn
	1i2VbzwCxQ/mJtEO742CY=; b=AL754i+VP3PqwgN/st2ISI+uI5N4CLsx8BkQgx
	4w+hioXnFYaMydQwD+OLIsXkbBozpYbQ3BlzgvNYoRPWwW2cfsSNDZzGT3SB23Fx
	mybtnc7GWUuH2/leQv9hsU5S9Rin48S4Tf4mlwUUR1wN6fVSOFEHh0bIxCrxxw+V
	3IpjTZ5fNMHeVP6nd0gWFdowDS4BrP89u9Xkdc6BRchAeppZPv9tGkr9vLKLxgFh
	uf/n1HN9UoQOYaMVuAUdYxAID8hNRTW5Ifmi1bK5EW5pxZJ7X4GKd0BeJLs79YAy
	HXBvacC6szhxr6FKY08SzvhJw17/9cnr5YNyiFfAazwvZUxQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y524das3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 07:05:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-798920399a6so2665249b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 00:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761289549; x=1761894349;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MPFm/NCSuFzQFNXPIOhYyn1i2VbzwCxQ/mJtEO742CY=;
        b=sI7+GHZvV0t9jniFWwpjx1MCbMUqOkezrzjY/0+sFSxr75ThcTTv5zJZxsKfuxqQLI
         C5lGXSZ708QGNYjQvHYT/pO5nuiDNTlKB3iO1bjR+OQYcAnbcvWDwwuYqOxCiTA9cd4a
         mRlNl2WrKohvxNUjUPxh+wQNikN1z/0iio+R7RtNy2ongDDN+ei0OCnkziN0FgQ03kWo
         wCywPd5WNrSDAO5fc+jQpgc9hBhGrktTt38wT2BZeP/k0ctFnc2Ri26MYPDXtO+8PzH6
         ks8kLhUJLBMW0m7Wipf3t9fL4k6/Lr9wA3cElwfMRPpiIFke1V77QTjcPwWJiOpvdH7Q
         ZG1g==
X-Forwarded-Encrypted: i=1; AJvYcCU2ng6w75CnuU4EaDKSRbFLFH0Qk3FwnhgMAsj+j5O236LrOgovDumOFTOICdtAHAkz3mWd+9X1RNIgw1YuaaZI@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6nAYs5QErR81DQ5UPOeTDUM+F2NjPsZv3LGH3xMf3BrP3O/x9
	ppt1NxfiGmfJwQBiMBLxnmoz/HOGvaHiIT5pHTPmV1Qlddi+fvIY+IrTrHPtvISKbVDqHqo6Yxj
	JLkkOgeiEiRhBboN17m4ygCELQZcjoPH43UEKRBvlsLD1GPWXLFdQJAfcSj8K3E+YLyJJhiZAfG
	/eWA==
X-Gm-Gg: ASbGnctpEhnldWrMbHay9RmMuqmNiSYYZhVw+fwOLlNc2p0wuK/xIVj6C2BJyjx29/d
	l4+ttQ4IsBjgYNxghTy/Ef6Vuwhg6hamBBXvSl56uHjedn/ChV0ZWYYzWB66dQfMnarpsjh7WzA
	I98A7/at3Si7GgzCfxm1+IAA8RmSHZVchC77BqOikONfWvz6Kf50UcwzZHXEojv4Y+DiaksDezG
	jJIPcxN5bcLk0RQAPYJwGr5t1AjZVgC0aDF/YaKKDBPPgZHNvSHKgkW9gczVghkcapgq6KQslm5
	K9ZYoDyIo6wS4UVlDsmd9KwZL9gNz6RWXEgGnF0PyokpBdybjspRqaXynxEGCP1yl+4gWJVBxeY
	66mqtIaedrsuj19VBBAhyxxviwrvEaZdpSPLU9/2Zo8UDTQt35oblH9ObI+Y/m3FXtBg=
X-Received: by 2002:a05:6a20:ed06:10b0:32d:b925:22ab with SMTP id adf61e73a8af0-33db3bee526mr1866826637.17.1761289549056;
        Fri, 24 Oct 2025 00:05:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJQ9T2emHV2bZHF8lO2qleCo7dP02qymM5n14tSKS/3Q55w2igAuPu5Ei3/WUqgMs/2EIcng==
X-Received: by 2002:a05:6a20:ed06:10b0:32d:b925:22ab with SMTP id adf61e73a8af0-33db3bee526mr1866789637.17.1761289548511;
        Fri, 24 Oct 2025 00:05:48 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274bb0c93sm4761001b3a.59.2025.10.24.00.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 00:05:48 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 15:05:31 +0800
Subject: [PATCH v4] stm: class: Add MIPI OST protocol support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-p_ost-v4-1-3652a06fd055@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADol+2gC/12MwQrDIBAFfyXsuQY1SqCn/kcJxejaCE1M3VRag
 v9em2MvD+YxzA6EKSDBudkhYQ4U4lJBnRqwk1nuyIKrDJJLLbhUbL1F2pjTXMtRmU70HVR3Tej
 D++hch8pToC2mz5HN6vf+F7JigjmLOJreo/DiEona58s8bJzntg4MpZQvGNlwwaEAAAA=
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, quic_yingdeng@quicinc.com,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761289544; l=12900;
 i=yingchao.deng@oss.qualcomm.com; s=20251024; h=from:subject:message-id;
 bh=Jc1azUFHBbMIpMUjBzGbn+2nUR9YgEFDgeBNR9sZk9A=;
 b=b/ezjY3rgJ4rE2bDOk9S4p+DfMmuOINSuXX0h+NL5EjvG8AmNWm3mcHHRxsBNaZ/zakFTp8Rt
 beQbmAaRWfdC4/rDTNY8eTBEkmN68fZ1r57sgTFhqM14DOMBax7jR34
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=NtBn/z8P2AMtGDeVaBWYauT/J/B0Js461LF0fOHs/u8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfXzLsKDfsMfBnO
 xPN79TY9/i8Pfo++mYH05ndLec5b8ql7C19tijwWCo3306JC1jqRRSRnlsvgDvWX5j53plE+XO/
 heE1Dhv93LzFleVhQj8a7d0fkiIbxEx0Sryd/xCvZEBX9rvuRJ00ZafsHiLzEkfbcnV6bNBJNIN
 H9xgbjPYDV/Shi2gAXO3M19B6dWduW0wq36ZV+m0f/lSgdsJ5BtY4AVczS5u3qHhJboX+usiBob
 ESfW1lWwqRhQZaq9JZMnjYdFDk+f1LPgYqUT1f2XeiwOrFyR5VFLiCUrEmM16gtMT2vGZ6OQBMO
 sV9+WYxo9MQyIj7eoffgUjWY9TyplV09YekckIy12HeE8y3bzLfGVUZzwC4bLkm4/5Dd1M2qxUZ
 RdAk9NtOjnIJ2jFhesBz+cr1idUrEw==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68fb254e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=XxusR3KdFzf1ftiqTncA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: l9GynPTVCKqMWQKV7XQv-An_wQqr6Xvr
X-Proofpoint-ORIG-GUID: l9GynPTVCKqMWQKV7XQv-An_wQqr6Xvr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_000552_102943_8E309FB3 
X-CRM114-Status: GOOD (  26.00  )
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

Add MIPI OST(Open System Trace) protocol support for stm to format the
traces. The OST Protocol abstracts the underlying layers from the sending
and receiving applications, thus removing dependencies on the connection
media and platform implementation.

OST over STP packet consists of Header/Payload/End. Header is designed to
include the information required by all OST packets. Information  that is
not shared by all packets is left to the higher layer protocols. Thus, the
OST Protocol Header can be regarded as the first part of a complete OST
Packet Header, while a higher layer header can be regarded as an extension
designed for a specific purpose.

+--------+--------+--------+--------+
| start  |version |entity  |protocol|
+--------+--------+--------+--------+
|    stm version  |      magic      |
+-----------------------------------+
|                cpu                |
+-----------------------------------+
|              timestamp            |
|                                   |
+-----------------------------------+
|                tgid               |
|                                   |
+-----------------------------------+
|               payload             |
+-----------------------------------+
|                 ...      |  end   |
+-----------------------------------+

In header, there will be STARTSIMPLE/VERSION/ENTITY/PROTOCOL.
STARTSIMPLE is used to signal the beginning of a simplified OST protocol.
The Version field is a one byte, unsigned number identifying the version
of the OST Protocol. The Entity ID field is a one byte unsigned number
that identifies the source.

The Protocol ID field is a one byte unsigned number identifying the higher
layer protocol of the OST Packet, i.e. identifying the format of the data
after the OST Protocol Header. OST Control Protocol ID value represents
the common control protocol, the remaining Protocol ID values may be used
by any higher layer protocols capable of being transported by the OST
Protocol.

Signed-off-by: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Signed-off-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
Changes in v4:
1. Delete unused variable 'i'.
2. Fix build error: call to undeclared function 'task_tgid_nr'.
Link to v3 - https://lore.kernel.org/all/20251022071834.1658684-1-yingchao.deng@oss.qualcomm.com/

Changes in v3:
1. Add more details about OST.
2. Delete 'entity_available' node, and 'entity' node will show available
and currently selected (shown in square brackets) entity.
3. Removed the usage of config_item->ci_group->cg_subsys->su_mutex.
Link to v2 - https://lore.kernel.org/all/20230419141328.37472-1-quic_jinlmao@quicinc.com/
---
 .../ABI/testing/configfs-stp-policy-p_ost          |   6 +
 Documentation/trace/p_ost.rst                      |  36 ++++
 drivers/hwtracing/stm/Kconfig                      |  14 ++
 drivers/hwtracing/stm/Makefile                     |   2 +
 drivers/hwtracing/stm/p_ost.c                      | 236 +++++++++++++++++++++
 5 files changed, 294 insertions(+)

diff --git a/Documentation/ABI/testing/configfs-stp-policy-p_ost b/Documentation/ABI/testing/configfs-stp-policy-p_ost
new file mode 100644
index 000000000000..498739b49da0
--- /dev/null
+++ b/Documentation/ABI/testing/configfs-stp-policy-p_ost
@@ -0,0 +1,6 @@
+What:		/config/stp-policy/<device>:p_ost.<policy>/<node>/entity
+Date:		Oct 2025
+KernelVersion:	6.18
+Description:
+		Set the entity which is to identify the source, RW.
+
diff --git a/Documentation/trace/p_ost.rst b/Documentation/trace/p_ost.rst
new file mode 100644
index 000000000000..df93b889eb4c
--- /dev/null
+++ b/Documentation/trace/p_ost.rst
@@ -0,0 +1,36 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===================
+MIPI OST over STP
+===================
+
+The OST(Open System Trace) driver is used with STM class devices to
+generate standardized trace stream. Trace sources can be identified
+by different entity ids.
+
+CONFIG_STM_PROTO_OST is for p_ost driver enablement. Once this config
+is enabled, you can select the p_ost protocol by command below:
+
+# mkdir /sys/kernel/config/stp-policy/stm0:p_ost.policy
+
+The policy name format is extended like this:
+    <device_name>:<protocol_name>.<policy_name>
+
+With coresight-stm device, it will be look like "stm0:p_ost.policy".
+
+With MIPI OST protocol driver, the attributes for each protocol node is:
+# mkdir /sys/kernel/config/stp-policy/stm0:p_ost.policy/default
+# ls /sys/kernel/config/stp-policy/stm0:p_ost.policy/default
+channels  entity    masters
+
+The entity here is the set the entity that p_ost supports. Currently
+p_ost supports ftrace, console and diag entity.
+
+Set entity:
+# echo 'ftrace' > /sys/kernel/config/stp-policy/stm0:p_ost.policy/default/entity
+
+Get available and currently selected (shown in square brackets) entity that p_ost supports:
+# cat /sys/kernel/config/stp-policy/stm0:p_ost.policy/default/entity
+[ftrace] console diag
+
+See Documentation/ABI/testing/configfs-stp-policy-p_ost for more details.
diff --git a/drivers/hwtracing/stm/Kconfig b/drivers/hwtracing/stm/Kconfig
index eda6b11d40a1..daa4aa09f64d 100644
--- a/drivers/hwtracing/stm/Kconfig
+++ b/drivers/hwtracing/stm/Kconfig
@@ -40,6 +40,20 @@ config STM_PROTO_SYS_T
 
 	  If you don't know what this is, say N.
 
+config STM_PROTO_OST
+	tristate "MIPI OST STM framing protocol driver"
+	default CONFIG_STM
+	help
+	  This is an implementation of MIPI OST protocol to be used
+	  over the STP transport. In addition to the data payload, it
+	  also carries additional metadata for entity, better
+	  means of trace source identification, etc.
+
+	  The receiving side must be able to decode this protocol in
+	  addition to the MIPI STP, in order to extract the data.
+
+	  If you don't know what this is, say N.
+
 config STM_DUMMY
 	tristate "Dummy STM driver"
 	help
diff --git a/drivers/hwtracing/stm/Makefile b/drivers/hwtracing/stm/Makefile
index 1692fcd29277..d9c8615849b9 100644
--- a/drivers/hwtracing/stm/Makefile
+++ b/drivers/hwtracing/stm/Makefile
@@ -5,9 +5,11 @@ stm_core-y		:= core.o policy.o
 
 obj-$(CONFIG_STM_PROTO_BASIC) += stm_p_basic.o
 obj-$(CONFIG_STM_PROTO_SYS_T) += stm_p_sys-t.o
+obj-$(CONFIG_STM_PROTO_OST)   += stm_p_ost.o
 
 stm_p_basic-y		:= p_basic.o
 stm_p_sys-t-y		:= p_sys-t.o
+stm_p_ost-y		:= p_ost.o
 
 obj-$(CONFIG_STM_DUMMY)	+= dummy_stm.o
 
diff --git a/drivers/hwtracing/stm/p_ost.c b/drivers/hwtracing/stm/p_ost.c
new file mode 100644
index 000000000000..ac9492ed5c2c
--- /dev/null
+++ b/drivers/hwtracing/stm/p_ost.c
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ *
+ * MIPI OST framing protocol for STM devices.
+ */
+
+#include <linux/pid.h>
+#include <linux/sched/clock.h>
+#include <linux/slab.h>
+#include <linux/stm.h>
+#include "stm.h"
+
+/*
+ * OST Base Protocol Header
+ *
+ * Position	Bits	Field Name
+ *      0       8       STARTSIMPLE
+ *      1       8       Version
+ *      2       8       Entity ID
+ *      3       8       protocol ID
+ */
+#define OST_FIELD_STARTSIMPLE		0
+#define OST_FIELD_VERSION		8
+#define OST_FIELD_ENTITY		16
+#define OST_FIELD_PROTOCOL		24
+
+#define OST_TOKEN_STARTSIMPLE		0x10
+#define OST_VERSION_MIPI1		0x10
+
+/* entity id to identify the source*/
+#define OST_ENTITY_FTRACE		0x01
+#define OST_ENTITY_CONSOLE		0x02
+#define OST_ENTITY_DIAG			0xEE
+
+#define OST_CONTROL_PROTOCOL		0x0
+
+#define DATA_HEADER ((OST_TOKEN_STARTSIMPLE << OST_FIELD_STARTSIMPLE) | \
+		     (OST_VERSION_MIPI1 << OST_FIELD_PROTOCOL) | \
+		     (OST_CONTROL_PROTOCOL << OST_FIELD_PROTOCOL))
+
+#define STM_MAKE_VERSION(ma, mi)	(((ma) << 8) | (mi))
+#define STM_HEADER_MAGIC		(0x5953)
+
+enum ost_entity_type {
+	OST_ENTITY_TYPE_NONE,
+	OST_ENTITY_TYPE_FTRACE,
+	OST_ENTITY_TYPE_CONSOLE,
+	OST_ENTITY_TYPE_DIAG,
+};
+
+static const char * const str_ost_entity_type[] = {
+	[OST_ENTITY_TYPE_NONE]		= "none",
+	[OST_ENTITY_TYPE_FTRACE]	= "ftrace",
+	[OST_ENTITY_TYPE_CONSOLE]	= "console",
+	[OST_ENTITY_TYPE_DIAG]		= "diag",
+};
+
+static const u32 ost_entity_value[] = {
+	[OST_ENTITY_TYPE_NONE]		= 0,
+	[OST_ENTITY_TYPE_FTRACE]	= OST_ENTITY_FTRACE,
+	[OST_ENTITY_TYPE_CONSOLE]	= OST_ENTITY_CONSOLE,
+	[OST_ENTITY_TYPE_DIAG]		= OST_ENTITY_DIAG,
+};
+
+struct ost_policy_node {
+	enum ost_entity_type	entity_type;
+};
+
+struct ost_output {
+	struct ost_policy_node	node;
+};
+
+/* Set default entity type as none */
+static void ost_policy_node_init(void *priv)
+{
+	struct ost_policy_node *pn = priv;
+
+	pn->entity_type = OST_ENTITY_TYPE_NONE;
+}
+
+static int ost_output_open(void *priv, struct stm_output *output)
+{
+	struct ost_policy_node *pn = priv;
+	struct ost_output *opriv;
+
+	opriv = kzalloc(sizeof(*opriv), GFP_ATOMIC);
+	if (!opriv)
+		return -ENOMEM;
+
+	memcpy(&opriv->node, pn, sizeof(opriv->node));
+	output->pdrv_private = opriv;
+	return 0;
+}
+
+static void ost_output_close(struct stm_output *output)
+{
+	kfree(output->pdrv_private);
+}
+
+static ssize_t ost_t_policy_entity_show(struct config_item *item,
+					char *page)
+{
+	struct ost_policy_node *pn = to_pdrv_policy_node(item);
+	ssize_t sz = 0;
+	int i;
+
+	for (i = 1; i < ARRAY_SIZE(str_ost_entity_type); i++) {
+		if (i == pn->entity_type)
+			sz += sysfs_emit_at(page, sz, "[%s] ", str_ost_entity_type[i]);
+		else
+			sz += sysfs_emit_at(page, sz, "%s ", str_ost_entity_type[i]);
+	}
+
+	sz += sysfs_emit_at(page, sz, "\n");
+	return sz;
+}
+
+static int entity_index(const char *str)
+{
+	int i;
+
+	for (i = 1; i < ARRAY_SIZE(str_ost_entity_type); i++) {
+		if (sysfs_streq(str, str_ost_entity_type[i]))
+			return i;
+	}
+
+	return 0;
+}
+
+static ssize_t
+ost_t_policy_entity_store(struct config_item *item, const char *page,
+			  size_t count)
+{
+	struct ost_policy_node *pn = to_pdrv_policy_node(item);
+	int i;
+
+	i = entity_index(page);
+	if (i)
+		pn->entity_type = i;
+	else
+		return -EINVAL;
+
+	return count;
+}
+CONFIGFS_ATTR(ost_t_policy_, entity);
+
+static struct configfs_attribute *ost_t_policy_attrs[] = {
+	&ost_t_policy_attr_entity,
+	NULL,
+};
+
+static ssize_t
+notrace ost_write(struct stm_data *data, struct stm_output *output,
+		  unsigned int chan, const char *buf, size_t count,
+		  struct stm_source_data *source)
+{
+	struct ost_output *op = output->pdrv_private;
+	unsigned int c = output->channel + chan;
+	unsigned int m = output->master;
+	const unsigned char nil = 0;
+	u32 header = DATA_HEADER;
+	struct trc_hdr {
+		u16 version;
+		u16 magic;
+		u32 cpu;
+		u64 timestamp;
+		u64 tgid;
+	} hdr;
+	ssize_t sz;
+
+	/*
+	 * Identify the source by entity type.
+	 * If entity type is not set, return error value.
+	 */
+	if (op->node.entity_type)
+		header |= ost_entity_value[op->node.entity_type];
+	else
+		return -EINVAL;
+
+	/*
+	 * STP framing rules for OST frames:
+	 *   * the first packet of the OST frame is marked;
+	 *   * the last packet is a FLAG with timestamped tag.
+	 */
+	/* Message layout: HEADER / DATA / TAIL */
+	/* HEADER */
+	sz = data->packet(data, m, c, STP_PACKET_DATA, STP_PACKET_MARKED,
+			  4, (u8 *)&header);
+	if (sz <= 0)
+		return sz;
+
+	/* DATA */
+	hdr.version	= STM_MAKE_VERSION(0, 3);
+	hdr.magic	= STM_HEADER_MAGIC;
+	hdr.cpu		= raw_smp_processor_id();
+	hdr.timestamp	= sched_clock();
+	hdr.tgid	= task_tgid_nr(current);
+	sz = stm_data_write(data, m, c, false, &hdr, sizeof(hdr));
+	if (sz <= 0)
+		return sz;
+
+	sz = stm_data_write(data, m, c, false, buf, count);
+
+	/* TAIL */
+	if (sz > 0)
+		data->packet(data, m, c, STP_PACKET_FLAG,
+			STP_PACKET_TIMESTAMPED, 0, &nil);
+
+	return sz;
+}
+
+static const struct stm_protocol_driver ost_pdrv = {
+	.owner			= THIS_MODULE,
+	.name			= "p_ost",
+	.write			= ost_write,
+	.policy_attr		= ost_t_policy_attrs,
+	.output_open		= ost_output_open,
+	.output_close		= ost_output_close,
+	.policy_node_init	= ost_policy_node_init,
+};
+
+static int ost_stm_init(void)
+{
+	return stm_register_protocol(&ost_pdrv);
+}
+module_init(ost_stm_init);
+
+static void ost_stm_exit(void)
+{
+	stm_unregister_protocol(&ost_pdrv);
+}
+module_exit(ost_stm_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MIPI Open System Trace STM framing protocol driver");

---
base-commit: efb26a23ed5f5dc3554886ab398f559dcb1de96b
change-id: 20251024-p_ost-d5052b4a3173

Best regards,
-- 
Yingchao Deng <yingchao.deng@oss.qualcomm.com>


