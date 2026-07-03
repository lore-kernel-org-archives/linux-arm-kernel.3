Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B207C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 12:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S2TwJwkErUivpqUKprvkpTHDqhJ7jfsJ3m5N7/IfH3M=; b=df6uMs9xXJAs3gMT+cxIyN5OVk
	Si6FES33+b7wzM+8H+uE0sTKaOK7EkeWf3DrnysScWFPk/9Bn58jNa41gF2bpinDFgLrx5/CURai8
	J5BjOczuJo+u/vbK6nqhvsf4Lcntu+vCoaCEHT+gY49y+HSkXKDCPimoIk9kOBpRIj4/JQ+yrrTxv
	60GDUg0kY0xOsozKvMXV4RichiJDsTsQhULXbuNdDR+0uDYV7lzXF1w8RnJTDHLof6rlZMvpMLIi7
	rAcCb/1xGGgCB/eo2ouqEEVkg1m9CIAePBPjO49CIpxFAekyKtg+AVeGEZs8jIGCuBeybOp/KaudU
	BLi6sb1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfd9g-00000006yYC-05kW;
	Fri, 03 Jul 2026 12:38:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfd9d-00000006yTg-3n0a
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 03 Jul 2026 12:38:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=S2TwJwkErUivpqUKprvkpTHDqhJ7jfsJ3m5N7/IfH3M=; b=rAS0rvlYWTgSTidqpQE10AaT2D
	KSCGLyV4cKkRZ4aDHvB79UtjFWvmm8sC1MX5aEJRfLov3HQNXPOghAoyjb8DB93JFW86Nn9GJYeou
	yMZyOP3uHhxQDWeILPH4d26h0H7jjhume7aMx+kcvqTnnfaSyLxTtM2ZXtvRxQA2LUm4v0d+9Ha7j
	Trk3+PjuIQ10rKgKNtjlFdPBeUJobktErnHpqGAv39NJbqYlesZ6NKnka39hPVlRUk0ygN1sqc160
	jijU8vKA2TQITetDdcWGm7yNLoFF1O89n9rp1QDnafpELtxMQTHjW9UWoEjgU1vyDlreTqIVxJw3H
	JCJXfPSg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wfd9a-00000004p1O-3HH3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 12:38:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F38A11F60;
	Fri,  3 Jul 2026 05:37:52 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED1533F905;
	Fri,  3 Jul 2026 05:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783082277; bh=8pxQiZvd3Qhzm7SH6qWb7mFPpu2MRNADR7R2FvMHyb8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OA4y7QHYvH+v6uyd2osto9FFjSUQpVMeM890m82ZpdbqEmlKjowk0/Lf85tP1WvQU
	 BJzIPve0Yuw2wBR0TA08ooQ2UEzktEOePhnAGrtjoeKxxL7AEGlZl7GQQ2YMIvtfRq
	 u3R32+zYzlMj0T32EC4KMiaEkWr0QWrP4sju6I/Q=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jic23@kernel.org,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	brauner@kernel.org,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v5 23/23] [RFC] tools/scmi: Add SCMI Telemetry testing tool
Date: Fri,  3 Jul 2026 13:36:01 +0100
Message-ID: <20260703123601.381275-24-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703123601.381275-1-cristian.marussi@arm.com>
References: <20260703123601.381275-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_133759_178191_1C4D722D 
X-CRM114-Status: GOOD (  18.63  )
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

Add a testing tool that exercises the SCMI ioctls UAPI interface: as of
now the tool simply queries the initial state of the SCMI Telemetry
subsystem, tries to enable all the existent Data Events and dumps all
the Telemetry data.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
Basic implementation just to exercise a few IOCTls: to be refined and
extended to support a more interactive usage.

v4 --> v5
 - changes to adapt to new chardev/IOCTLs ABI
 - change IOCTLs param to avoid flexible arrays
 - added SHMTIs mmap dump
v3 --> v4
 - added generation file support
---
 tools/testing/scmi/Makefile |  25 ++
 tools/testing/scmi/stlm.c   | 648 ++++++++++++++++++++++++++++++++++++
 2 files changed, 673 insertions(+)
 create mode 100644 tools/testing/scmi/Makefile
 create mode 100644 tools/testing/scmi/stlm.c

diff --git a/tools/testing/scmi/Makefile b/tools/testing/scmi/Makefile
new file mode 100644
index 000000000000..a6a101f8398b
--- /dev/null
+++ b/tools/testing/scmi/Makefile
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+CC?=$(CROSS_COMPILE)gcc
+OBJS = stlm.o
+
+CFLAGS=-Wall -static -std=gnu11 -I ../../../include/uapi/
+ifneq ($(DEBUG), )
+	CFLAGS+=-O0 -g -ggdb
+else
+	CFLAGS+=-static
+endif
+
+all: stlm
+
+stlm: $(OBJS)
+	$(CC) $(CFLAGS) $^ -o $@
+
+%.o: %.c
+	$(CC) $(CFLAGS) -c $<
+
+clean:
+	rm -f *.o
+	rm -f stlm
+
+.PHONY: clean
diff --git a/tools/testing/scmi/stlm.c b/tools/testing/scmi/stlm.c
new file mode 100644
index 000000000000..4d7d19899d5c
--- /dev/null
+++ b/tools/testing/scmi/stlm.c
@@ -0,0 +1,648 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <errno.h>
+#include <fcntl.h>
+#include <poll.h>
+#include <stddef.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+
+#include <unistd.h>
+
+#include <linux/scmi.h>
+
+#define SLEEP_MS	3000
+
+#define IOCTL_ERR_STR(_ioctl)	"IOCTL:" #_ioctl
+
+struct tlm_de {
+	struct scmi_tlm_de_info *info;
+	struct scmi_tlm_de_config cfg;
+	struct scmi_tlm_de_sample sample;
+};
+
+struct tlm_group {
+	int fd;
+	struct scmi_tlm_grp_info *info;
+	struct scmi_tlm_grp_desc *desc;
+	struct scmi_tlm_intervals *ivs;
+};
+
+struct tlm_state {
+	int dfd;
+	int fd;
+	int g_dfd;
+	const char *path;
+	struct scmi_tlm_base_info info;
+	struct scmi_tlm_config cfg;
+	struct scmi_tlm_intervals *ivs;
+	struct scmi_tlm_shmtis_list *ssl;
+	unsigned int num_des;
+	struct tlm_de *des;
+	unsigned int num_groups;
+	struct tlm_group *grps;
+};
+
+static inline void dump_state(struct tlm_state *st)
+{
+	uint32_t *uuid32 = st->info.de_impl_version;
+	uint16_t *uuid16 = (uint16_t *)&st->info.de_impl_version[1];
+	struct scmi_tlm_update_interval *intervals;
+	struct scmi_tlm_shmti_info *shinfo;
+
+	fprintf(stdout, "- SYSTEM TELEMETRY @instance: %s\n\n", st->path);
+	fprintf(stdout, "+ Version: 0x%08X\n", st->info.version);
+	fprintf(stdout, "+ DEs#: %d\n", st->info.num_des);
+	fprintf(stdout, "+ GRPS#: %d\n", st->info.num_groups);
+	fprintf(stdout, "+ INTRV#: %d\n", st->info.num_intervals);
+	fprintf(stdout, "+ SHMTIS#: %d\n", st->info.num_shmtis);
+
+	fprintf(stdout, "+ UUID: ");
+	fprintf(stdout, "%X-", uuid32[0]);
+	fprintf(stdout, "%X-", uuid16[0]);
+	fprintf(stdout, "%X-", uuid16[1]);
+	fprintf(stdout, "%X", uuid16[2]);
+	fprintf(stdout, "%X\n", uuid32[3]);
+
+	fprintf(stdout, "\n+ TLM_ENABLED: %d\n", st->cfg.enable);
+	fprintf(stdout, "+ CURRENT_UPDATE_INTERVAL: %u,%d\n",
+		st->cfg.active.secs, st->cfg.active.exp);
+
+	fprintf(stdout, "+ Found #%u Global Update Intervals\n",
+		st->ivs->num_intervals);
+	intervals = (struct scmi_tlm_update_interval *)st->ivs->intervals;
+	for (int i = 0; i < st->ivs->num_intervals; i++)
+		fprintf(stdout, "\t[%d]::%u,%d\n", i,
+			intervals[i].secs, intervals[i].exp);
+
+	fprintf(stdout, "+ Found #%u SHMTI areas\n", st->ssl->num_shmtis);
+	shinfo = (struct scmi_tlm_shmti_info *)st->ssl->shmtis;
+	for (int i = 0; i < st->ssl->num_shmtis; i++)
+		fprintf(stdout, "\t[%d]:: FD:%u  LEN:%u\n",
+			shinfo[i].sid, shinfo[i].fd, shinfo[i].len);
+
+	if (st->info.num_des != st->num_des) {
+		fprintf(stdout, "\n++++++ DES NOT FULLY_ENUMERATED ++++++\n");
+		fprintf(stdout, "+++ DECLARED:%u  ENUMERATED:%u +++\n",
+			st->info.num_des, st->num_des);
+	}
+
+	fprintf(stdout, "\n+ Found #%d DEs:\n", st->num_des);
+	for (int i = 0; i < st->num_des; i++) {
+		fprintf(stdout, "\t[0x%08X][%s]\n",
+			st->des[i].info->id, st->des[i].info->name);
+		fprintf(stdout, "\t\tGRP_ID:0x%08X  SZ:%u  TYPE:%u  UNIT:%u  UNIT_EXP:%d  TS_RATE:%d\n",
+			st->des[i].info->grp_id, st->des[i].info->data_sz,
+			st->des[i].info->type, st->des[i].info->unit,
+			st->des[i].info->unit_exp, st->des[i].info->ts_rate);
+		fprintf(stdout, "\t\tINST_ID:%u  COMPO_ID:%u  COMPO_TYPE:%u  PERSIST:%u\n\n",
+			st->des[i].info->instance_id, st->des[i].info->compo_instance_id,
+			st->des[i].info->compo_type, st->des[i].info->persistent);
+	}
+	fprintf(stdout, "\n");
+
+	for (int i = 0; i < st->num_des; i++) {
+		fprintf(stdout, "\t[0x%08X][%s]\t\t%s %s\n\t\t-->> TS:%16llu %016llX\n",
+			st->des[i].info->id,st->des[i].info->name,
+			st->des[i].cfg.enable ? "ON" : "OFF",
+			st->des[i].cfg.t_enable ? "/TS_ON " : "/TS_OFF",
+			st->des[i].sample.tstamp, st->des[i].sample.val);
+	}
+	fprintf(stdout, "\n");
+
+	fprintf(stdout, "+ Found %d GRPs: ", st->num_groups);
+	for (int i = 0; i < st->num_groups; i++) {
+		struct scmi_tlm_update_interval *grp_intrvs;
+		struct tlm_group *grp = &st->grps[i];
+		uint32_t *composing_des;
+
+		fprintf(stdout, "\n\tGRP_ID:%d  DES#:%d  INTRVS#:%d\n",
+			grp->info->grp_id, grp->info->num_des,
+			grp->info->num_intervals);
+
+		fprintf(stdout, "\tGRP Intervals:\n");
+		grp_intrvs = (struct scmi_tlm_update_interval *)grp->ivs->intervals;
+		for (int j = 0; j < grp->ivs->num_intervals; j++)
+			fprintf(stdout, "\t[%d]::%u,%d\n", j,
+				grp_intrvs[j].secs, grp_intrvs[j].exp);
+
+		composing_des = (uint32_t *)grp->desc->composing_des;
+		fprintf(stdout, "\tCOMPOSING_DES:");
+		for (int j = 0; j < grp->desc->num_des; j++)
+			fprintf(stdout, "0x%08X ", composing_des[j]);
+		fprintf(stdout, "\n");
+	}
+}
+
+static int discover_base_info(int fd, struct scmi_tlm_base_info *info)
+{
+	int ret;
+
+	ret = ioctl(fd, SCMI_TLM_GET_INFO, info);
+	if (ret) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_GET_INFO));
+		return ret;
+	}
+
+	return ret;
+}
+
+static struct scmi_tlm_des_list *scmi_get_des_list(int fd, int num_des)
+{
+	struct scmi_tlm_des_list *dsl;
+	struct scmi_tlm_de_info *dei;
+	size_t sz, d_sz;
+	int ret;
+
+	sz = sizeof(*dsl);
+	dsl = malloc(sz);
+	if (!dsl)
+		return NULL;
+
+	bzero(dsl, sz);
+
+	d_sz = sizeof(*dei) * num_des;
+	dei = malloc(d_sz);
+	if (!dei) {
+		free(dsl);
+		return NULL;
+	}
+
+	bzero(dei, d_sz);
+
+	dsl->num_des = num_des;
+	dsl->des = (uint64_t)dei;
+	ret = ioctl(fd, SCMI_TLM_GET_DE_LIST, dsl);
+	if (ret) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_GET_DE_LIST));
+		return NULL;
+	}
+
+	return dsl;
+}
+
+static struct tlm_de *enumerate_des(struct tlm_state *st)
+{
+	struct scmi_tlm_des_list *dsl;
+	struct tlm_de *des;
+
+	dsl = scmi_get_des_list(st->fd, st->info.num_des);
+	if (!dsl)
+		return NULL;
+
+	st->num_des = dsl->num_des;
+	des = malloc(sizeof(*des) * st->num_des);
+	if (!des)
+		return NULL;
+
+	bzero(des, sizeof(*des) * st->num_des);
+	for (int i = 0; i < st->num_des; i++) {
+		struct tlm_de *de = &des[i];
+		int ret;
+
+		de->info = &(((struct scmi_tlm_de_info *)dsl->des)[i]);
+		de->cfg.id = de->info->id;
+		ret = ioctl(st->fd, SCMI_TLM_GET_DE_CFG, &de->cfg);
+		if (ret) {
+			perror(IOCTL_ERR_STR(SCMI_TLM_GET_DE_CFG));
+			continue;
+		}
+
+		if (!de->cfg.enable)
+			continue;
+
+		/* Collect initial sample */
+		de->sample.id = de->info->id;
+		ret = ioctl(st->fd, SCMI_TLM_GET_DE_VALUE, &de->sample);
+		if (ret) {
+			perror(IOCTL_ERR_STR(SCMI_TLM_GET_DE_VALUE));
+			continue;
+		}
+	}
+
+	return des;
+}
+
+static int get_current_config(int fd, struct scmi_tlm_config *cfg)
+{
+	int ret;
+
+	ret = ioctl(fd, SCMI_TLM_GET_CFG, cfg);
+	if (ret) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_GET_CFG));
+		return ret;
+	}
+
+	return ret;
+}
+
+static struct scmi_tlm_grps_list *scmi_get_grps_list(int fd, int num_groups)
+{
+	struct scmi_tlm_grps_list *gsl;
+	struct scmi_tlm_grp_info *grps;
+	size_t sz, grps_sz;
+	int ret;
+
+	sz = sizeof(*gsl);
+	gsl = malloc(sz);
+	if (!gsl)
+		return NULL;
+
+	bzero(gsl, sz);
+	grps_sz = sizeof(*grps) * num_groups;
+	grps = malloc(grps_sz);
+	if (!grps) {
+		free(gsl);
+		return NULL;
+	}
+
+	gsl->num_grps = num_groups;
+	gsl->grps = (uint64_t)grps;
+	ret = ioctl(fd, SCMI_TLM_GET_GRP_LIST, gsl);
+	if (ret) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_GET_GRP_LIST));
+		free(grps);
+		free(gsl);
+		return NULL;
+	}
+
+	return gsl;
+}
+
+static struct scmi_tlm_intervals *
+enumerate_intervals(int fd, int num_intervals, unsigned *grp_id)
+{
+	struct scmi_tlm_update_interval *intervs;
+	struct scmi_tlm_intervals *ivs;
+	size_t sz, i_sz;
+	int ret;
+
+	sz = sizeof(*ivs);
+	ivs = malloc(sz);
+	if (!ivs)
+		return NULL;
+
+	bzero(ivs, sz);
+
+	i_sz = sizeof(*intervs) * num_intervals;
+	intervs = malloc(i_sz);
+	if (!intervs) {
+		free(ivs);
+		return NULL;
+	}
+
+	bzero(intervs, i_sz);
+
+	ivs->num_intervals = num_intervals;
+	ivs->intervals = (uint64_t)intervs;
+	if (grp_id) {
+		ivs->grp_id = *grp_id;
+		ivs->flags = SCMI_TLM_INTERV_GROUP;
+	}
+
+	ret = ioctl(fd, SCMI_TLM_GET_INTRVS, ivs);
+	if (ret) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_GET_INTRVS));
+		free(ivs);
+		free(intervs);
+		return NULL;
+	}
+
+	return ivs;
+}
+
+static struct scmi_tlm_shmtis_list *enumerate_shmtis(struct tlm_state *st)
+{
+	struct scmi_tlm_shmti_info *shmtis;
+	struct scmi_tlm_shmtis_list *ssl;
+	size_t sz, shmtis_sz;
+	int ret;
+
+	sz = sizeof(*ssl);
+	ssl = malloc(sz);
+	if (!ssl)
+		return NULL;
+
+	bzero(ssl, sz);
+	shmtis_sz = sizeof(*shmtis) * st->info.num_shmtis;
+	shmtis = malloc(shmtis_sz);
+	if (!shmtis) {
+		free(ssl);
+		return NULL;
+	}
+
+	ssl->num_shmtis = st->info.num_shmtis;
+	ssl->shmtis = (uint64_t)shmtis;
+	ret = ioctl(st->fd, SCMI_TLM_GET_SHMTI_LIST, ssl);
+	if (ret) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_GET_SHMTI_LIST));
+		free(shmtis);
+		free(ssl);
+		return NULL;
+	}
+
+	return ssl;
+}
+
+static struct tlm_group *enumerate_groups(struct tlm_state *st)
+{
+	struct scmi_tlm_grps_list *gsl;
+	struct tlm_group *grps;
+
+	gsl = scmi_get_grps_list(st->fd, st->info.num_groups);
+	if (!gsl)
+		return NULL;
+
+	st->num_groups = gsl->num_grps;
+	grps = malloc(sizeof(*grps) * st->num_groups);
+	if (!grps)
+		return NULL;
+
+	bzero(grps, sizeof(*grps) * st->num_groups);
+	for (int i = 0; i < st->num_groups; i++) {
+		struct tlm_group *grp = &grps[i];
+		size_t size, composing_sz;
+		uint32_t *composing_des;
+		int ret;
+
+		grp->info = &(((struct scmi_tlm_grp_info *)gsl->grps)[i]);
+		size = sizeof(*grp->desc);
+		grp->desc = malloc(size);
+		if (!grp->desc)
+			return NULL;
+
+		bzero(grp->desc, size);
+		composing_sz = sizeof(uint32_t) * grp->info->num_des;
+		composing_des = malloc(composing_sz);
+		if (!composing_des) //XXX BAD Cleanup
+			return NULL;
+
+		grp->desc->grp_id = grp->info->grp_id;
+		grp->desc->num_des = grp->info->num_des;
+		grp->desc->composing_des = (uint64_t)composing_des;
+		ret = ioctl(st->fd, SCMI_TLM_GET_GRP_DESC, grp->desc);
+		if (ret) {
+			perror(IOCTL_ERR_STR(SCMI_TLM_GET_GRP_DESC));
+			continue;
+		}
+
+		grp->ivs = enumerate_intervals(st->fd, grp->info->num_intervals,
+					       &grp->info->grp_id);
+	}
+
+	return grps;
+}
+
+static int get_tlm_state(const char *path, struct tlm_state *st)
+{
+	int ret;
+
+	st->dfd = open(path, O_RDONLY);
+	if (st->dfd < 0) {
+		perror("open");
+		return st->dfd;
+	}
+
+	st->fd = openat(st->dfd, "tlm_0", O_RDWR);
+	if (st->fd < 0) {
+		perror("openat");
+		return st->fd;
+	}
+
+	ret = discover_base_info(st->fd, &st->info);
+	if (ret)
+		return ret;
+
+	st->ivs = enumerate_intervals(st->fd, st->info.num_intervals, NULL);
+	if (!st->ivs)
+		return -1;
+
+	ret = get_current_config(st->fd, &st->cfg);
+	if (ret)
+		return ret;
+
+	if (st->info.num_des)
+		st->des = enumerate_des(st);
+
+	if (st->info.num_groups)
+		st->grps = enumerate_groups(st);
+
+	if (st->info.num_shmtis)
+		st->ssl = enumerate_shmtis(st);
+
+	st->path = path;
+
+	return 0;
+}
+
+#define MAX_GENERATIONS		5
+
+static void get_tlm_generation(struct tlm_state *st)
+{
+	int fd, i = 0;
+	struct pollfd pfds[1];
+
+	fd = openat(st->dfd, "generation", O_RDONLY);
+	if (fd < 0) {
+		perror("openat");
+		return ;
+	}
+
+	pfds[0].fd = fd;
+	pfds[0].events = POLLIN;
+
+	do {
+		int ret;
+
+		pfds[0].revents = 0;
+		ret = poll(pfds, 1, -1);
+		if (ret < 0 ) {
+			perror("poll generation");
+			break;;
+		}
+
+		if (!pfds[0].revents)
+			continue;
+
+		if (pfds[0].revents & POLLIN) {
+			int n;
+			char buf[32] = {};
+
+			n = read(fd, buf, 32);
+			if (n < 0) {
+				perror("read generation");
+				break;
+			}
+
+			fprintf(stdout, "Generation[%u]: %s\n", i, buf);
+		}
+	} while (i++ < MAX_GENERATIONS);
+
+	close(fd);
+}
+
+static int dump_shmti(struct scmi_tlm_shmti_info *shmti)
+{
+	void *tdcf;
+	ssize_t bytes = 0;
+
+	tdcf = mmap(NULL, shmti->len, PROT_READ, MAP_SHARED, shmti->fd, 0);
+	if (tdcf == MAP_FAILED) {
+		fprintf(stderr, "%s\n", strerror(errno));
+		return -1;
+	}
+
+	tdcf += shmti->offset;
+	do {
+		bytes += write(1, tdcf + bytes, shmti->len - bytes);
+		if (bytes < 0)
+			return -1;
+	} while (bytes < shmti->len);
+
+	return bytes;
+}
+
+int main(int argc, char **argv)
+{
+	const char *tlm_root_instance = "/dev/scmi/";
+	struct scmi_tlm_data_read *bulk;
+	struct scmi_tlm_de_config de_cfg = {};
+	struct scmi_tlm_de_sample *samples;
+	struct scmi_tlm_shmti_info *shmtis;
+	size_t bulk_sz, samples_sz;
+	struct tlm_state st = {};
+	int ret;
+
+	ret = get_tlm_state(tlm_root_instance, &st);
+	if (ret)
+		return ret;
+
+	if (argc > 1) {
+		struct scmi_tlm_shmti_info *shmti;
+		int ret, sid = atoi(argv[1]);
+
+		if (sid >= st.ssl->num_shmtis)
+			return -1;
+
+		shmti = &(((struct scmi_tlm_shmti_info *)(st.ssl->shmtis))[sid]);
+
+		fprintf(stderr, "Binary DUMP of SHMTI[%u] LEN:%u\n",
+			shmti->sid, shmti->len);
+
+		ret = dump_shmti(shmti);
+		if (ret < 0)
+			return ret;
+
+		return 0;
+	}
+
+	dump_state(&st);
+
+	//get_tlm_generation(&st);
+	bulk_sz = sizeof(*bulk);
+	bulk = malloc(bulk_sz);
+	if (!bulk)
+		return -1;
+
+	bzero(bulk, bulk_sz);
+	samples_sz = st.info.num_des * sizeof(*samples);
+	samples = malloc(samples_sz);
+	if (!samples)
+		return -1;
+
+	bzero(samples, samples_sz);
+	bulk->samples = (uint64_t)samples;
+	bulk->num_samples = st.info.num_des;
+	ret = ioctl(st.fd, SCMI_TLM_SINGLE_SAMPLE, bulk);
+	if (ret) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_SINGLE_SAMPLE));
+		return -1;
+	}
+
+	fprintf(stdout, "\n- Single ASYNC read -\n-------------------\n");
+	for (int i = 0; i < bulk->num_samples; i++)
+		fprintf(stdout, "0x%08X %016llu %016llX\n",
+			samples[i].id, samples[i].tstamp, samples[i].val);
+
+	fprintf(stdout, "\n--- Enabling ALL DEs with timestamp...\n");
+	de_cfg.enable = 1;
+	de_cfg.t_enable = 1;
+	ret = ioctl(st.fd, SCMI_TLM_SET_ALL_CFG, &de_cfg);
+	if (ret) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_SET_ALL_CFG));
+		return ret;
+	}
+
+	bzero(samples, samples_sz);
+	bulk->num_samples = st.info.num_des;
+	ret = ioctl(st.fd, SCMI_TLM_BULK_READ, bulk);
+	if (ret) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_BULK_READ));
+		return -1;
+	}
+
+	fprintf(stdout, "\n- BULK read -\n-------------------\n");
+	for (int i = 0; i < bulk->num_samples; i++)
+		fprintf(stdout, "0x%08X %016llu %016llX\n",
+			samples[i].id, samples[i].tstamp, samples[i].val);
+
+	bzero(samples, samples_sz);
+	bulk->num_samples = 5;
+	samples[0].id = 0x1010;
+	samples[1].id = 0xA001;
+	samples[2].id = 0xA005;
+	samples[3].id = 0x2020;
+	samples[4].id = 0x0003;
+	ret = ioctl(st.fd, SCMI_TLM_BATCH_READ, bulk);
+	if (ret) {
+		perror(IOCTL_ERR_STR(SCMI_TLM_BATCH_READ));
+		return -1;
+	}
+
+	fprintf(stdout, "\n- BATCH read -\n-------------------\n");
+	for (int i = 0; i < bulk->num_samples; i++)
+		fprintf(stdout, "0x%08X %016llu %016llX\n",
+			samples[i].id, samples[i].tstamp, samples[i].val);
+
+	fprintf(stdout, "\n- SHMTI mmap dump -\n-------------------\n");
+	shmtis = (struct scmi_tlm_shmti_info *)st.ssl->shmtis;
+	for (int i = 0; i < st.ssl->num_shmtis; i++) {
+		unsigned long *start, *end;
+		void *tdcf;
+		char *buf;
+
+		fprintf(stdout, "Mapping SHMTI[%u] - SID:%u  LEN:%u  FD:%u  OFFS:%u\n",
+			i, shmtis[i].sid, shmtis[i].len, shmtis[i].fd, shmtis[i].offset);
+
+		tdcf = mmap(NULL, shmtis[i].len, PROT_READ, MAP_SHARED,
+			    shmtis[i].fd, 0);
+		if (tdcf == MAP_FAILED) {
+			fprintf(stderr, "%s\n", strerror(errno));
+			return -1;
+		}
+
+		start = tdcf + shmtis[i].offset;
+		end = tdcf + shmtis[i].offset + shmtis[i].len;
+
+		fprintf(stdout, "-----------------------------------------------------\n");
+		fprintf(stdout, "Mapped SHMTI - SID:%u  %u@%p\n",
+			shmtis[i].sid, shmtis[i].offset, tdcf);
+
+		buf = (char *)start;
+		for (int j = 0; j < 4; j++)
+			fprintf(stdout, "%c ", buf[j]);
+
+		fprintf(stdout, " ===> ");
+
+		buf = ((char *)end) - 4;
+		for (int j = 0 ; j < 4; j++)
+			fprintf(stdout, "%c ", buf[j]);
+		fprintf(stdout, "\n-----------------------------------------------------\n");
+	}
+
+	return 0;
+}
-- 
2.54.0


